import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dog_bloc_event.dart';
part 'dog_bloc_state.dart';

class DogBlocBloc extends Bloc<DogBlocEvent, DogBlocState> {
  DogBlocBloc() : super(DogBlocInitial()) {
    on<DogBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
