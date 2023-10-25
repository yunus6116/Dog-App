import 'package:auto_route/auto_route.dart';
import 'package:dog_app/view/main_page/settings_page/constants/settings_constants.dart';
import 'package:dog_app/view/main_page/settings_page/models/setting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    this.version,
  });
  final String? version;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFF2F2F7),
      child: Column(
        children: <Widget>[
          Container(
            height: 4.0,
            width: 50.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: SettingsConstants.settingItems.length,
              itemBuilder: (context, index) {
                final item = SettingsConstants.settingItems[index];
                return SettingsListItem(
                  index: index,
                  item: item,
                  version: version,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// SettingsListItem is a widget that is used to display the settings items.
class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    super.key,
    required this.index,
    required this.item,
    this.version,
  });
  final int index;
  final SettingItemModel item;
  final String? version;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(item.itemAssetPath),
              const SizedBox(width: 11),
              Text(
                item.itemTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              index == SettingsConstants.settingItems.length - 1
                  ? Text("v${version ?? "1.0.0"}")
                  : SvgPicture.asset("assets/svg_icons/arrow_upright_icon.svg"),
            ],
          ),
        ),
        index != 5 ? const SizedBox(height: 12) : const SizedBox.shrink(),
        index != 5
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
