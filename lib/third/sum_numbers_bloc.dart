import 'package:bunch_of_tasks/third/sum_numbers_event.dart';
import 'package:bunch_of_tasks/third/sum_numbers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SumNumbersBloc extends Bloc<SumNumbersEvent, NumberState> {
  SumNumbersBloc() : super(NumberState(sum: 0)) {
    on<AddNumber>(_onAddNumbers, transformer: mergeTransformer());
  }

  void _onAddNumbers(AddNumber event, Emitter<NumberState> emit) {
    emit(NumberState(sum: state.sum + event.value));
  }

  EventTransformer<E> mergeTransformer<E>() {
    return (events, mapper) => events.flatMap(mapper);
  }
}
