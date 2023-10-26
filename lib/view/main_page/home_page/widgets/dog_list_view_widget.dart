import 'package:dog_app/core/extensions/context_extensions.dart';
import 'package:dog_app/models/breeds_response_model.dart';
import 'package:dog_app/view/main_page/home_page/models/dog_model.dart';
import 'package:dog_app/view/main_page/home_page/widgets/dog_card_widget.dart';
import 'package:flutter/material.dart';

class DogListViewWidget extends StatelessWidget {
  const DogListViewWidget({
    Key? key,
    required this.dogList,
    required this.breedsModel,
  }) : super(key: key);
  final List<DogModel> dogList;
  final BreedsModel breedsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          GridView.builder(
              itemCount: dogList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisExtent: (context.width / 2) - 48, // 163.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (_, index) {
                return DogCardWidget(
                  dogModel: dogList[index],
                  subBreedList: breedsModel.toMap().entries.toList()[index].value,
                );
              }),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
