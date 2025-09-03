

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bunch_of_tasks/seventh/add_state_event.dart';
import 'package:bunch_of_tasks/seventh/add_task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskBloc extends Bloc<AddTask, AddTaskState> {
  AddTaskBloc() : super(AddTaskState(task: '', time: 0)) {
    on<AddTask>(_onAddTask, transformer: sequential());
  }

  void _onAddTask(AddTask event, Emitter<AddTaskState> emit) async {
    await Future.delayed(Duration(milliseconds: event.time));
    emit(AddTaskState(task: event.task, time: event.time));
  }
}
