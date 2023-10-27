import '../../repo/dog_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_dog_event.dart';
part 'random_dog_state.dart';

/// RandomDogBloc is a [bloc] that manages the state of [RandomDogBloc].
class RandomDogBloc extends Bloc<RandomDogEvent, RandomDogState> {
  final DogRepositories _dogRepositories;
  RandomDogBloc(this._dogRepositories) : super(RandomDogInitial()) {
    /// This method is used to listen the GetRandomDogEvent and emit the state according to the response.
    on<GetRandomDogEvent>((event, emit) async {
      emit(RandomDogLoadingState());
      try {
        final response = await _dogRepositories.getRandomDogImage(event.breedName);
        emit(RandomDogLoadedState(response));
      } catch (e) {
        emit(RandomDogErrorState(e.toString()));
      }
    });
  }
}
