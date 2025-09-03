import 'package:equatable/equatable.dart';

class TimerState extends Equatable{
  final int time;

  const TimerState({required this.time});
  @override
  List<Object?> get props => [time];

}