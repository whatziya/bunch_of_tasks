import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/third/sum_numbers_bloc.dart';
import 'package:bunch_of_tasks/third/sum_numbers_event.dart';
import 'package:bunch_of_tasks/third/sum_numbers_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NumberBloc merge', () {
    late SumNumbersBloc numberBloc;

    setUp(() {
      numberBloc = SumNumbersBloc();
    });

    tearDown(() {
      numberBloc.close();
    });

    blocTest<SumNumbersBloc, NumberState>(
      'добавляем числа по очереди',
      build: () => numberBloc,
      act: (bloc) {
        bloc.add(AddNumber(1));
        bloc.add(AddNumber(2));
        bloc.add(AddNumber(3));
      },
      expect: () => [
        const NumberState(sum: 1),
        const NumberState(sum: 3),
        const NumberState(sum: 6),
      ],
    );

    blocTest<SumNumbersBloc, NumberState>(
      'параллельные вызовы тоже суммируются',
      build: () => numberBloc,
      act: (bloc) async {
        bloc.add(AddNumber(5));
        bloc.add(AddNumber(7));
        bloc.add(AddNumber(8));
      },
      expect: () => [
        const NumberState(sum: 5),
        const NumberState(sum: 12),
        const NumberState(sum: 20),
      ],
    );
  });
}
