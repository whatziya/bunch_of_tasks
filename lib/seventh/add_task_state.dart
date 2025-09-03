import 'package:equatable/equatable.dart';

class AddTaskState extends Equatable {
  final String task;
  final int time;

  const AddTaskState({required this.task, required this.time});

  @override
  List<Object?> get props => [task, time];
}
