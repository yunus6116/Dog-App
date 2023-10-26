import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dog_app/bloc/dog_bloc_bloc.dart';
import 'package:dog_app/core/helper/cache_image_helper.dart';
import 'package:dog_app/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

/// SplashScreen is the first screen that is shown when the app is opened.
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    FlutterNativeSplash.remove();
    // add DogBlocEventGetDog event to the bloc
    context.read<DogBlocBloc>().add(DogBlocEventGetDog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<DogBlocBloc, DogBlocState>(
      listener: (context, state) {
        if (state is DogsLoadedState) {
          context.read<DogBlocBloc>().add(DogBlocEventGetAllDogs(state.breedsResponseModel));
        }
        if (state is AllRandomDogImageListLoadedState) {
          CacheImageHelper.cacheImages(
                  imageUrls: state.dogList.map((e) {
                    return e.imageUrl!;
                  }).toList(),
                  context: context)
              .then((value) {
            debugPrint("CACHED");
            context.router.pushAndPopUntil(const MainRoute(), predicate: (_) => false);
          });
        }
        if (state is DogsErrorState) {
          debugPrint("RESPONSE: ${state.error}");
          // Show error snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/app_icon.png"),
            ),
          ],
        ),
      ),
    ));
  }
}
