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
            height: 4.0, // En üstteki çizgi (divider) yüksekliği
            width: 50.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
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
                )),
          ),
        ],
      ),
    );
  }
}

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
        ListTile(
          leading: SvgPicture.asset(item.itemAssetPath),
          title: Text(item.itemTitle),
          trailing: index == SettingsConstants.settingItems.length - 1
              ? Text("v${version ?? "1.0.0"}")
              : SvgPicture.asset("assets/svg_icons/arrow_upright_icon.svg"),
          // Diğer özelleştirmeler buraya eklenebilir
        ),
        index != 5
            ? const Divider(
                height: 1,
                thickness: 1,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
