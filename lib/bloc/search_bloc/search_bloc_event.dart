part of 'search_bloc_bloc.dart';

@immutable
sealed class SearchBlocEvent {
  const SearchBlocEvent();
}

class SearchTextChangedEvent extends SearchBlocEvent {
  final String query;
  final List<DogModel>? dogList;
  const SearchTextChangedEvent(this.query, this.dogList);
}
