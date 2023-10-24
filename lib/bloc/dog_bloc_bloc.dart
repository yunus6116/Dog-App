import 'package:dog_app/models/breeds_response_model.dart';
import 'package:dog_app/repo/dog_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dog_bloc_event.dart';
part 'dog_bloc_state.dart';

class DogBlocBloc extends Bloc<DogBlocEvent, DogBlocState> {
  final DogRepositories _dogRepositories;
  List<String> randomDogImageResponseList = [];
  DogBlocBloc(this._dogRepositories) : super(DogBlocInitial()) {
    on<DogBlocEventGetDog>((event, emit) async {
      emit(DogsLoadingState());
      try {
        final breedsResponse = await _dogRepositories.getDogBreeds();
        emit(DogsLoadedState(breedsResponse));
      } catch (e) {
        emit(DogsErrorState(e.toString()));
      }
    });

    on<DogBlocEventGetRandomDogImage>((event, emit) async {
      emit(DogsLoadingState());
      try {
        debugPrint(event.breedsResponseModel.message!.hound![0]);
        final List<Future<String>> futures = event.breedsResponseModel.message!.toMap().entries.map((entry) async {
          final breedName = entry.key;
          return _dogRepositories.getRandomDogImage(breedName);
        }).toList();

        final List<String> randomImages = await Future.wait(futures);
        randomDogImageResponseList = randomImages;
        emit(DogsRandomImageLoadedState(
          randomDogImageResponseList: randomImages,
          breedsResponseModel: event.breedsResponseModel,
        ));
      } catch (e) {
        emit(DogsErrorState(e.toString()));
      }
    });
  }
}
