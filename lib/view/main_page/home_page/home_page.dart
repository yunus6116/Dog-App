import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/bloc/dog_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: blocBody());
  }

  Widget blocBody() {
    return Stack(
      children: [
        BlocBuilder<DogBlocBloc, DogBlocState>(
          builder: (context, state) {
            if (state is DogsRandomImageLoadedState) {
              debugPrint("RESPONSE: ${state.breedsResponseModel.message!.hound![0]}");
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        itemCount: state.breedsResponseModel.message!.toMap().entries.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (_, index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Colors.grey[300],
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: state.randomDogImageResponseList[index],
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                        child: Text(
                                          state.breedsResponseModel.message!.toMap().entries.toList()[index].key,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ),
                  const SizedBox(height: 80),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator.adaptive());
          },
        ),
        // search by breeds name

        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
