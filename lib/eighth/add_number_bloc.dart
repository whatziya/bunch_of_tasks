import 'package:bunch_of_tasks/eighth/add_number_event.dart';
import 'package:bunch_of_tasks/eighth/add_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class AddNumberBloc extends Bloc<AddNUmber, AddNumberState> {
  AddNumberBloc() : super(AddNumberState(sum: 0)) {
    on<AddNUmber>(_onAddNumber, transformer: debounceTime());
  }

  void _onAddNumber(AddNUmber event, Emitter<AddNumberState> emit) {
    emit(AddNumberState(sum: state.sum + event.value));
  }

  EventTransformer<E> debounceTime<E>() =>
      (events, mapper) => events
          .bufferTime(const Duration(milliseconds: 500))
          .flatMap((batch) => Stream.fromIterable(batch))
          .flatMap(mapper);
}
