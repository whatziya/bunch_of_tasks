import 'package:equatable/equatable.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

final class Increment extends CounterEvent {
  const Increment();
}