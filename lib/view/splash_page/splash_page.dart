import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
    await Future.delayed(const Duration(seconds: 5), () {
      FlutterNativeSplash.remove();
      context.router.pushAndPopUntil(const MainRoute(), predicate: (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Image.asset("assets/images/app_icon.png"),
        ),
      ],
    ));
  }
}
