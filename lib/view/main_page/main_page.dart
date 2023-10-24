import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/plugins/system_info.dart';
import 'package:dog_app/core/router/app_router.gr.dart';
import 'package:dog_app/core/theme/colors.dart';
import 'package:dog_app/view/main_page/settings_page/settings_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              context.topRoute.title(context),
              style: const TextStyle(color: Colors.black),
            ),
            leading: const AutoLeadingButton(ignorePagelessRoutes: true),
          ),
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNav'] == true;
    return hideBottomNav
        ? const SizedBox.shrink()
        : BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: MainColors.mainLightColor,
            onTap: (int index) async {
              if (index == 0) {
                tabsRouter.setActiveIndex(index);
              }
              if (index == 1) {
                String version = await SystemInfo.getOSVersion();
                if (!mounted) return;
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SettingsPage(
                      version: version,
                    );
                  },
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg_icons/home_icon.svg"),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg_icons/settings_icon.svg"),
                label: 'Settings',
              ),
            ],
          );
  }
}

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Dashboard'),
          onPressed: () {
            context.pushRoute(const MainRoute());
          },
        ),
      ),
    );
  }
}
