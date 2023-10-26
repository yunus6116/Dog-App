import 'package:dog_app/bloc/dog_bloc/dog_bloc_bloc.dart';
import 'package:dog_app/bloc/search_bloc/search_bloc_bloc.dart';
import 'package:dog_app/core/router/app_router.dart';
import 'package:dog_app/repo/dog_repositories.dart';
import 'package:dog_app/view/main_page/home_page/dog_detail_sheet/bloc/random_dog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Preserve splash screen on app resume
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DogBlocBloc>(
          create: (BuildContext context) => DogBlocBloc(DogRepositories()),
        ),
        BlocProvider<RandomDogBloc>(
          create: (BuildContext context) => RandomDogBloc(DogRepositories()),
        ),
        BlocProvider<SearchBlocBloc>(
          create: (BuildContext context) => SearchBlocBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
