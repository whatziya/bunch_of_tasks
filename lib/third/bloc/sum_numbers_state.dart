import 'package:equatable/equatable.dart';

class NumberState extends Equatable {
  final int sum;

  const NumberState({required this.sum});

  @override
  List<Object?> get props => [sum];
}
