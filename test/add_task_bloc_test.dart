import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/seventh/add_state_event.dart';
import 'package:bunch_of_tasks/seventh/add_task_bloc.dart';
import 'package:bunch_of_tasks/seventh/add_task_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddTaskBloc test', () {
    late AddTaskBloc addTaskBloc;

    setUp(() {
      addTaskBloc = AddTaskBloc();
    });

    tearDown(() {
      addTaskBloc.close();
    });

    blocTest(
      'test if sequence is correct',
      build: () => AddTaskBloc(),
      act: (bloc) {
        bloc.add(AddTask(task: 'task1', time: 500));
        bloc.add(AddTask(task: 'task2', time: 100));
        bloc.add(AddTask(task: 'task3', time: 300));
      },
      wait: const Duration(milliseconds: 1000),
      expect: () => [
        AddTaskState(task: 'task1', time: 500),
        AddTaskState(task: 'task2', time: 100),
        AddTaskState(task: 'task3', time: 300),
      ],
    );

  });
}
