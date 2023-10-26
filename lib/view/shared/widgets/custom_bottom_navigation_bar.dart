import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/plugins/system_info.dart';
import 'package:dog_app/core/theme/colors.dart';
import 'package:dog_app/core/theme/text_styles.dart';
import 'package:dog_app/view/main_page/settings_page/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/extensions/context_extensions.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const CustomBottomNavigationBar({super.key, required this.tabsRouter});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: SizedBox(
        height: context.height * .12,
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          color: Colors.grey[100],
          child: Stack(
            children: [
              Row(
                children: List.generate(2, (index) {
                  var isSelectedItem = tabsRouter.activeIndex == index;
                  return Expanded(
                    child: InkWell(
                      onTap: () async {
                        HapticFeedback.mediumImpact();
                        if (index == 0) {
                          tabsRouter.setActiveIndex(index);
                        }
                        if (index == 1) {
                          String version = await SystemInfo.getOSVersion();

                          // ignore: use_build_context_synchronously
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0),
                          SvgPicture.asset(
                              index == 0 ? "assets/svg_icons/home_icon.svg" : "assets/svg_icons/settings_icon.svg"),
                          const SizedBox(height: 4),
                          _buildTabText(index, isSelectedItem),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              // add vertical divider to the center
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 24,
                  width: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabText(int index, bool isSelectedItem) {
    switch (index) {
      case 0:
        return Text(
          'HOME',
          style:
              AppTextStyles.body7.copyWith(color: isSelectedItem ? MainColors.mainLightColor : const Color(0xFF9B9B9B)),
        );
      case 1:
        return Text(
          'Settings',
          style:
              AppTextStyles.body7.copyWith(color: isSelectedItem ? MainColors.mainLightColor : const Color(0xFF9B9B9B)),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
