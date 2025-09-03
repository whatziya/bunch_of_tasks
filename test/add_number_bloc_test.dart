import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/eighth/add_number_bloc.dart';
import 'package:bunch_of_tasks/eighth/add_number_event.dart';
import 'package:bunch_of_tasks/eighth/add_number_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddNumberBloc test', () {
    late AddNumberBloc addNumberBloc;
    setUp(() {
      addNumberBloc = AddNumberBloc();
    });

    tearDown(() {
      addNumberBloc.close();
    });

    blocTest(
      'simple case test',
      build: () => addNumberBloc,
      act: (bloc) async {
        bloc.add(AddNUmber(value: 1));
        bloc.add(AddNUmber(value: 2));
        bloc.add(AddNUmber(value: 3));
        bloc.add(AddNUmber(value: 4));
        await Future.delayed(const Duration(milliseconds: 600));
        bloc.add(AddNUmber(value: 1));
        bloc.add(AddNUmber(value: 2));
        bloc.add(AddNUmber(value: 3));
        bloc.add(AddNUmber(value: 4));
      },
      wait: const Duration(milliseconds: 600),
      expect: () => [
        AddNumberState(sum: 1),
        AddNumberState(sum: 3),
        AddNumberState(sum: 6),
        AddNumberState(sum: 10),
      ],
    );
  });
}
