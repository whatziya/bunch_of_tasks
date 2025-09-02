import 'package:equatable/equatable.dart';

sealed class CounterState extends Equatable {
  const CounterState({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}

final class CounterResult extends CounterState {
  const CounterResult({required super.count});
}
