part of 'dog_bloc_bloc.dart';

/// DogBlocEvent is a [sealed class] that manages the event of [DogBlocBloc].
@immutable
sealed class DogBlocEvent {}

/// This event is used to get random dog image for all dogs
class DogBlocEventGetDog extends DogBlocEvent {
  DogBlocEventGetDog();
}

/// This event is used to get random dog image for all dogs
class DogBlocEventGetAllDogs extends DogBlocEvent {
  final BreedsResponseModel breedsResponseModel;
  DogBlocEventGetAllDogs(this.breedsResponseModel);
}

/// This event is used to change the state of [DogBlocState]
class ChangeStateEvent extends DogBlocEvent {
  final DogBlocState dogBlocState;
  ChangeStateEvent(this.dogBlocState);
}
