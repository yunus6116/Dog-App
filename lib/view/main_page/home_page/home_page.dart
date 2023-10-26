import 'package:auto_route/auto_route.dart';
import 'package:dog_app/bloc/dog_bloc/dog_bloc_bloc.dart';
import 'package:dog_app/view/main_page/home_page/widgets/dog_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dog_app/view/shared/shimmer/shimmer_effect.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: blocBody(context),
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

  Widget blocBody(BuildContext context) {
    return BlocBuilder<DogBlocBloc, DogBlocState>(
      builder: (context, state) {
        return Stack(
          children: [
            BlocBuilder<DogBlocBloc, DogBlocState>(
              builder: (context, state) {
                if (state is AllRandomDogImageListLoadedState) {
                  return DogListViewWidget(
                    dogList: state.dogList,
                    breedsModel: state.breedsModel,
                  );
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
          ],
        );
      },
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
}
