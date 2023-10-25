part of 'random_dog_bloc.dart';

/// RandomDogState is a [sealed class] that manages the state of [RandomDogBloc].
@immutable
abstract class RandomDogState extends Equatable {}

/// This state is used to show initial state of [RandomDogBloc]
final class RandomDogInitial extends RandomDogState {
  @override
  List<Object?> get props => [];
}

/// This state is used to show loading state of [RandomDogBloc]
class RandomDogLoadingState extends RandomDogState {
  @override
  List<Object?> get props => [];
}

/// This state is used to show loaded state of [RandomDogBloc]
class RandomDogLoadedState extends RandomDogState {
  final String dogImage;
  RandomDogLoadedState(this.dogImage);
  @override
  List<Object?> get props => [dogImage];
}

/// This state is used to show error state of [RandomDogBloc]
class RandomDogErrorState extends RandomDogState {
  final String error;
  RandomDogErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
