import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/core/helper/cache_image_helper.dart';
import 'package:dog_app/core/theme/colors.dart';
import 'package:dog_app/view/main_page/home_page/dog_detail_sheet/bloc/random_dog_bloc.dart';
import 'package:dog_app/view/shared/widgets/generated_dog_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dog_app/core/extensions/context_extensions.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogDetailSheet extends StatelessWidget {
  const DogDetailSheet({
    Key? key,
    required this.imageUrl,
    required this.breedName,
    required this.subBreedList,
  }) : super(key: key);

  final String imageUrl;
  final String breedName;
  final List<String>? subBreedList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<RandomDogBloc, RandomDogState>(
      listener: (context, state) {
        if (state is RandomDogLoadedState) {
          CacheImageHelper.cacheImages(context: context, imageUrls: [state.dogImage]).then((value) {
            debugPrint("CACHED");
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              builder: (BuildContext context) {
                return GeneratedDogSheet(
                  imageUrl: state.dogImage,
                );
              },
            );
          });
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDogImageHeader(context, state),
            _buildDogDetailInfoSection(),
            _buildDogGenerateButtonSection(context, state),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildDogGenerateButtonSection(BuildContext context, RandomDogState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0085FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(double.infinity, 56),
        ),
        onPressed: () {
          // if state not DogsLoadingState then add DogBlocEventGetRandomDog
          if (state is! RandomDogLoadingState) {
            HapticFeedback.mediumImpact();
            context.read<RandomDogBloc>().add(GetRandomDogEvent(breedName));
          }
        },
        child: state is RandomDogLoadingState
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
            : const Text(
                "Generate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }

  Column _buildDogDetailInfoSection() {
    return Column(
      children: [
        const SizedBox(height: 12),
        const Text(
          "Breed",
          style: TextStyle(
            color: MainColors.mainLightColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Divider(
            color: CupertinoColors.systemGrey,
            height: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          breedName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            const Text(
              "Sub Breed",
              style: TextStyle(
                color: MainColors.mainLightColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Divider(
                color: CupertinoColors.systemGrey,
                height: 2,
              ),
            ),
            const SizedBox(height: 8),
            subBreedList != null && subBreedList!.isNotEmpty
                ? ListView.builder(
                    itemCount: subBreedList!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          subBreedList![index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  )
                : const Text("-"),
          ],
        ),
        const SizedBox(height: 26),
      ],
    );
  }

  Stack _buildDogImageHeader(BuildContext context, RandomDogState state) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Container(
            height: context.height * 0.4,
            width: double.infinity,
            color: Colors.grey[300],
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: InkWell(
            onTap: state is RandomDogLoadingState
                ? null
                : () {
                    HapticFeedback.lightImpact();
                    context.router.pop();
                  },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
