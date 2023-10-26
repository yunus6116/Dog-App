import 'package:dog_app/models/breeds_response_model.dart';
import 'package:dog_app/repo/dog_repositories.dart';
import 'package:dog_app/view/main_page/home_page/models/dog_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dog_bloc_event.dart';
part 'dog_bloc_state.dart';

/// DogBlocBloc is a [Bloc] that manages the state of [DogBlocState].
class DogBlocBloc extends Bloc<DogBlocEvent, DogBlocState> {
  final DogRepositories _dogRepositories;
  DogBlocBloc(this._dogRepositories) : super(DogBlocInitial()) {
    /// This event is used to get all dog breeds
    on<DogBlocEventGetDog>((event, emit) async {
      emit(DogsLoadingState());
      try {
        final breedsResponse = await _dogRepositories.getDogBreeds();
        emit(DogsLoadedState(breedsResponse));
      } catch (e) {
        emit(DogsErrorState(e.toString()));
      }
    });

    /// This event is used to get random dog image for all dogs
    on<DogBlocEventGetAllDogs>((event, emit) async {
      emit(DogsLoadingState());
      try {
        debugPrint(event.breedsResponseModel.breedsModel!.hound![0]);
        final List<Future<String>> futures = event.breedsResponseModel.breedsModel!.toMap().entries.map((entry) async {
          final breedName = entry.key;
          return _dogRepositories.getRandomDogImage(breedName);
        }).toList();

        final List<String> randomImages = await Future.wait(futures);
        List<DogModel> dogList = [];
        for (var element in randomImages) {
          dogList.add(DogModel(
            imageUrl: element,
          ));
        }
        for (var i = 0; i < event.breedsResponseModel.breedsModel!.toMap().entries.toList().length; i++) {
          for (var j = 0; j < dogList.length; j++) {
            dogList[i] =
                dogList[i].copyWith(name: event.breedsResponseModel.breedsModel!.toMap().entries.toList()[i].key);
          }
        }
        emit(AllRandomDogImageListLoadedState(
          dogList: dogList,
          breedsModel: event.breedsResponseModel.breedsModel!,
        ));
      } catch (e) {
        emit(DogsErrorState(e.toString()));
      }
    });

    /// This event is used to change the state of [DogBlocState]
    on<ChangeStateEvent>((event, emit) async {
      emit(event.dogBlocState);
    });
  }
}
