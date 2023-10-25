import 'package:auto_route/auto_route.dart';
import 'package:dog_app/bloc/dog_bloc_bloc.dart';
import 'package:dog_app/core/extensions/context_extensions.dart';
import 'package:dog_app/view/main_page/home_page/widgets/dog_card_widget.dart';
import 'package:dog_app/view/shared/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: blocBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "Dog App",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: const AutoLeadingButton(ignorePagelessRoutes: true),
    );
  }

  Widget blocBody() {
    return Stack(
      children: [
        BlocBuilder<DogBlocBloc, DogBlocState>(
          builder: (context, state) {
            if (state is AllRandomDogImageListLoadedState) {
              return _buildDogListView(state, context);
            }
            if (state is DogsErrorState) {
              return _buildErrorView(state);
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  GridView.builder(
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisExtent: 163.5,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (_, index) {
                        return ShimmerEffect(
                          child: Container(
                            height: 163.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 80),
                ],
              ),
            );
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

  Center _buildErrorView(DogsErrorState state) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(state.error),
        ],
      ),
    );
  }

  Padding _buildDogListView(AllRandomDogImageListLoadedState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          GridView.builder(
              itemCount: state.breedsResponseModel.breedsModel!.toMap().entries.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisExtent: (context.width / 2) - 48, // 163.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (_, index) {
                return DogCardWidget(
                  breedName: state.breedsResponseModel.breedsModel!.toMap().entries.toList()[index].key,
                  imageUrl: state.randomDogImageResponseList[index],
                  subBreedList: state.breedsResponseModel.breedsModel!.toMap().entries.toList()[index].value,
                );
              }),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
