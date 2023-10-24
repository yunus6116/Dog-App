part of 'dog_bloc_bloc.dart';

@immutable
sealed class DogBlocEvent {}

class DogBlocEventGetDog extends DogBlocEvent {
  DogBlocEventGetDog();
}

class DogBlocEventGetRandomDogImage extends DogBlocEvent {
  final BreedsResponseModel breedsResponseModel;
  DogBlocEventGetRandomDogImage(this.breedsResponseModel);
}
