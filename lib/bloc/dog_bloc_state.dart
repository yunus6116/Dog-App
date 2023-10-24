part of 'dog_bloc_bloc.dart';

@immutable
abstract class DogBlocState extends Equatable {}

final class DogBlocInitial extends DogBlocState {
  @override
  List<Object?> get props => [];
}

class DogsLoadingState extends DogBlocState {
  @override
  List<Object?> get props => [];
}

class DogsLoadedState extends DogBlocState {
  final BreedsResponseModel breedsResponseModel;
  DogsLoadedState(this.breedsResponseModel);
  @override
  List<Object?> get props => [breedsResponseModel];
}

class DogsErrorState extends DogBlocState {
  final String error;
  DogsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class DogsRandomImageLoadedState extends DogBlocState {
  final List<String> randomDogImageResponseList;
  final BreedsResponseModel breedsResponseModel;
  DogsRandomImageLoadedState({required this.randomDogImageResponseList, required this.breedsResponseModel});
  @override
  List<Object?> get props => [randomDogImageResponseList];
}
