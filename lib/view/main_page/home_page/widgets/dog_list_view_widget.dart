import 'package:dog_app/bloc/search_bloc/search_bloc_bloc.dart';
import 'package:dog_app/core/extensions/context_extensions.dart';
import 'package:dog_app/core/theme/colors.dart';
import 'package:dog_app/core/theme/text_styles.dart';
import 'package:dog_app/models/breeds_response_model.dart';
import 'package:dog_app/view/main_page/home_page/models/dog_model.dart';
import 'package:dog_app/view/main_page/home_page/widgets/dog_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DogListViewWidget extends HookWidget {
  const DogListViewWidget({
    Key? key,
    required this.dogList,
    required this.breedsModel,
  }) : super(key: key);
  final List<DogModel> dogList;
  final BreedsModel breedsModel;

  @override
  Widget build(BuildContext context) {
    final hasClicked = useState(false);
    final isExpanded = useState(false);
    final controller = useTextEditingController();
    return BlocBuilder<SearchBlocBloc, SearchBlocState>(
      builder: (context, state) {
        return InkWell(
          highlightColor: Colors.white,
          splashColor: Colors.white,
          focusColor: Colors.white,
          onTap: () {
            hasClicked.value = false;
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              state is SearchState
                  ? state.filteredList.isNotEmpty
                      ? _buildFilteredDogList(state, context)
                      : _buildNoResultFoundView()
                  : _buildDogList(context),
              const SizedBox(height: 80),
              // search by breeds name
              _buildSearchView(hasClicked, controller, isExpanded, context),
            ],
          ),
        );
      },
    );
  }

  Align _buildSearchView(ValueNotifier<bool> hasClicked, TextEditingController controller,
      ValueNotifier<bool> isExpanded, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: !hasClicked.value
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE5E5EA),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(.16),
                        blurRadius: 16,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      hasClicked.value = true;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Text(
                        controller.text.isNotEmpty ? controller.text : "Search",
                        style: AppTextStyles.body1.copyWith(
                          color: controller.text.isNotEmpty ? Colors.black : const Color(0xFF3C3C43).withOpacity(.6),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            )
          : GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta != null) {
                  if (details.primaryDelta! < 0) {
                    // Scroll up
                    isExpanded.value = true;
                  } else {
                    // Scroll down
                    isExpanded.value = false;
                  }
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isExpanded.value ? context.height : context.height * .125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: const Color(0xFFE5E5EA),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 4,
                      width: 32,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5EA),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    TextField(
                      autofocus: true,
                      controller: controller,
                      cursorColor: MainColors.mainLightColor,
                      cursorWidth: 2,
                      cursorHeight: 19,
                      maxLines: isExpanded.value ? null : 3,
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                      onChanged: (query) {
                        context.read<SearchBlocBloc>().add(SearchTextChangedEvent(query, dogList));
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Center _buildNoResultFoundView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No result found",
            style: AppTextStyles.heading3,
          ),
          const SizedBox(height: 16),
          Text(
            "Try searching with another word",
            style: AppTextStyles.body1.copyWith(color: const Color(0xFF3C3C43).withOpacity(.6)),
          ),
        ],
      ),
    );
  }

  Padding _buildDogList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
          itemCount: dogList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisExtent: (context.width / 2) - 48,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (_, index) {
            return DogCardWidget(
              dogModel: dogList[index],
              subBreedList: breedsModel.toMap().entries.toList()[index].value,
            );
          }),
    );
  }

  Padding _buildFilteredDogList(SearchState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
          itemCount: state.filteredList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisExtent: (context.width / 2) - 48,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (_, index) {
            return DogCardWidget(
              dogModel: state.filteredList[index],
              subBreedList: breedsModel
                  .toMap()
                  .entries
                  .toList()
                  .firstWhere((element) => element.key == state.filteredList[index].name)
                  .value,
            );
          }),
    );
  }
}
