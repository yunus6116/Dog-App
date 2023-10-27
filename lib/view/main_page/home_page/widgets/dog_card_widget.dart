import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../dog_detail_sheet/dog_detail_sheet.dart';
import '../models/dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DogCardWidget extends StatelessWidget {
  const DogCardWidget({
    Key? key,
    required this.subBreedList,
    required this.dogModel,
  }) : super(key: key);

  final List<String>? subBreedList;
  final DogModel dogModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          builder: (BuildContext context) {
            return DogDetailSheet(
              breedName: dogModel.name!,
              imageUrl: dogModel.imageUrl ?? "",
              subBreedList: subBreedList,
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.grey[300],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: dogModel.imageUrl ?? "",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              _buildDogCardTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildDogCardTitle() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: 163.5 / 3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.64),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                dogModel.name!.capitalizeFirstLetter(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
