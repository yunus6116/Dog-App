import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/view/main_page/home_page/dog_detail_sheet/dog_detail_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DogCardWidget extends StatelessWidget {
  const DogCardWidget({
    Key? key,
    required this.imageUrl,
    required this.breedName,
    required this.subBreedList,
  }) : super(key: key);

  final String imageUrl;
  final String breedName;
  final List<String>? subBreedList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          builder: (BuildContext context) {
            return DogDetailSheet(
              breedName: breedName,
              imageUrl: imageUrl,
              subBreedList: subBreedList,
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.grey[300],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              _buildDogCardTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildDogCardTitle() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: 163.5 / 3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.64),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                breedName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
