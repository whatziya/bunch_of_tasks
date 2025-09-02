import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/first/bloc/counter_bloc.dart';
import 'package:bunch_of_tasks/first/bloc/counter_event.dart';
import 'package:bunch_of_tasks/first/bloc/counter_state.dart';
import 'package:test/test.dart';

void main() {
  group('CounterBloc throttle', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc.close();
    });

    blocTest('throttle correct working', build: () => counterBloc,
      act: (bloc) {
        bloc.add(Increment());
        bloc.add(Increment());
      },
      expect: () => [CounterResult(count: 1)],
    );

    blocTest('throttle correct working', build: () => counterBloc,
      act: (bloc) async {
        bloc.add(Increment());
        await Future.delayed(const Duration(milliseconds: 500));
        bloc.add(Increment());
      },
      expect: () => [CounterResult(count: 1), CounterResult(count: 2)],
    );
  });
}
