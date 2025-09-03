import 'package:equatable/equatable.dart';

class AddTask extends Equatable {
  final String task;
  final int time;

  const AddTask({required this.task, required this.time});

  @override
  List<Object?> get props => [task, time];
}