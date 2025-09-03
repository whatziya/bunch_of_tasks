import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/fourth/timer_bloc.dart';
import 'package:bunch_of_tasks/fourth/timer_event.dart';
import 'package:bunch_of_tasks/fourth/timer_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimerBloc', () {
    late TimerBloc timerBloc;

    setUp(() {
      timerBloc = TimerBloc();
    });

    tearDown(() {
      timerBloc.close();
    });

    blocTest<TimerBloc, TimerState>(
      'Tick уменьшает время через 1 секунду',
      build: () => TimerBloc(),
      act: (bloc) async {
        bloc.add(Tick());
      },
      wait: const Duration(milliseconds: 1100),
      expect: () => [
        const TimerState(time: 59),
      ],
    );

    blocTest<TimerBloc, TimerState>(
      'два Tick подряд уменьшают время дважды (каждый с интервалом)',
      build: () => TimerBloc(),
      act: (bloc) async {
        bloc.add(Tick());
        bloc.add(Tick());
      },
      wait: const Duration(milliseconds: 2100),
      expect: () => [
        const TimerState(time: 59),
        const TimerState(time: 58),
      ],
    );
  });
}
