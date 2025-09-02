import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterResult(count: 0)) {
    on<Increment>(
      _onIncrement,
      transformer: throttleTransformer(const Duration(milliseconds: 500)),
    );
  }

  void _onIncrement(Increment event, Emitter<CounterState> emit) {
    emit(CounterResult(count: state.count + 1));
  }

  EventTransformer<E> throttleTransformer<E>(Duration duration) {
    return (events, mapper) => events.throttleTime(duration).flatMap(mapper);
  }
}
