import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/router/app_router.gr.dart';
import 'package:dog_app/view/shared/widgets/custom_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(context) {
    return AutoTabsRouter(
      routes: [
        const HomeRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNav'] == true;
    return hideBottomNav ? const SizedBox.shrink() : CustomBottomNavigationBar(tabsRouter: tabsRouter);
  }
}
