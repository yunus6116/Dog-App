import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/plugins/system_info.dart';
import 'package:dog_app/core/router/app_router.gr.dart';
import 'package:dog_app/core/theme/colors.dart';
import 'package:dog_app/view/main_page/settings_page/settings_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              HapticFeedback.mediumImpact();
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
