import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'timer_event.dart';
import 'timer_state.dart';

class TimerBloc extends Bloc<Tick, TimerState> {
  TimerBloc() : super(const TimerState(time: 60)) {
    on<Tick>(_onTickEvent, transformer: interval());
  }

  void _onTickEvent(Tick event, Emitter<TimerState> emit) {
    if (state.time > 0) {
      emit(TimerState(time: state.time - 1));
    }
  }

  EventTransformer<E> interval<E>() {
    return (events, mapper) => events
        .interval(const Duration(seconds: 1))
        .asyncExpand(mapper);
  }
}
