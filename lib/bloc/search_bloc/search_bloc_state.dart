part of 'search_bloc_bloc.dart';

@immutable
abstract class SearchBlocState extends Equatable {}

final class SearchBlocInitial extends SearchBlocState {
  final List<String> filteredList;

  SearchBlocInitial(this.filteredList);
  @override
  List<Object?> get props => [filteredList];
}

final class SearchState extends SearchBlocState {
  final List<DogModel> filteredList;

  SearchState(this.filteredList);
  @override
  List<Object?> get props => [filteredList];
}
