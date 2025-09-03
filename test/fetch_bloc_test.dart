import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/sixth/fetch_bloc.dart';
import 'package:bunch_of_tasks/sixth/fetch_event.dart';
import 'package:bunch_of_tasks/sixth/fetch_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FetchBloc test', () {
    late FetchBloc fetchBloc;
    setUp(() {
      fetchBloc = FetchBloc();
    });
    tearDown(() {
      fetchBloc.close();
    });

    blocTest(
      'Test if droppable is not processing two fetchings',
      build: () => fetchBloc,
      act: (bloc) {
        bloc.add(FetchData(smth: 'hello'));
        bloc.add(FetchData(smth: 'hallo'));
      },
      wait: const Duration(seconds: 3),
      expect: () => [FetchState(smth: 'hello')],
    );

    blocTest<FetchBloc, FetchState>(
      'processes second event after first finishes',
      build: () => FetchBloc(),
      act: (bloc) async {
        bloc.add(FetchData(smth: 'hello'));
        await Future.delayed(const Duration(seconds: 2));
        bloc.add(FetchData(smth: 'hallo'));
        await Future.delayed(const Duration(seconds: 2));
      },
      expect: () => [
        FetchState(smth: 'hello'),
        FetchState(smth: 'hallo'),
      ],
    );

  });
}
