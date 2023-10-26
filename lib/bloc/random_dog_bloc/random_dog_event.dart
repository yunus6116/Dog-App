part of 'random_dog_bloc.dart';

/// RandomDogEvent is a [sealed class] that manages the events of [RandomDogBloc].
@immutable
sealed class RandomDogEvent {}

/// This event is used to get random dog image.
class GetRandomDogEvent extends RandomDogEvent {
  final String breedName;
  GetRandomDogEvent(this.breedName);
}
