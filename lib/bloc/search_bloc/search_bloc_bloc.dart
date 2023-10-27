import '../../view/main_page/home_page/models/dog_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBlocBloc() : super(SearchBlocInitial(const [])) {
    on<SearchTextChangedEvent>((event, emit) {
      final query = event.query.toLowerCase();
      final filteredList = _filterBreedList(dogList: event.dogList!, query: query);
      emit(SearchState(filteredList));
    });
  }
  List<DogModel> _filterBreedList({required List<DogModel> dogList, required String query}) {
    return dogList.where((dog) => dog.name!.toLowerCase().contains(query.trim())).toList();
  }
}
