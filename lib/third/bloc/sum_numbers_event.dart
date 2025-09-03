import 'package:equatable/equatable.dart';

sealed class SumNumbersEvent extends Equatable {
  const SumNumbersEvent();

  @override
  List<Object?> get props => [];
}

final class AddNumber extends SumNumbersEvent {
  final int value;

  const AddNumber(this.value);

  @override
  List<Object?> get props => [value];
}
