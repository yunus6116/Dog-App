part of 'dog_bloc_bloc.dart';

/// DogBlocState is a [sealed class] that manages the state of [DogBlocBloc].
@immutable
abstract class DogBlocState extends Equatable {}

/// This state is used to show initial state of [DogBlocBloc]
final class DogBlocInitial extends DogBlocState {
  @override
  List<Object?> get props => [];
}

/// This state is used to show loading state of [DogBlocBloc]
class DogsLoadingState extends DogBlocState {
  @override
  List<Object?> get props => [];
}

/// This state is used to show loaded state of [DogBlocBloc]
class DogsLoadedState extends DogBlocState {
  final BreedsResponseModel breedsResponseModel;
  DogsLoadedState(this.breedsResponseModel);
  @override
  List<Object?> get props => [breedsResponseModel];
}

/// This state is used to show error state of [DogBlocBloc]
class DogsErrorState extends DogBlocState {
  final String error;
  DogsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

/// This state is used to show random image loaded state of [DogBlocBloc]
class AllRandomDogImageListLoadedState extends DogBlocState {
  final List<String> randomDogImageResponseList;
  final BreedsResponseModel breedsResponseModel;
  AllRandomDogImageListLoadedState({required this.randomDogImageResponseList, required this.breedsResponseModel});
  @override
  List<Object?> get props => [randomDogImageResponseList];
}
