import 'package:equatable/equatable.dart';

class AddNumberState extends Equatable {
  final int sum;

  const AddNumberState({required this.sum});

  @override
  List<Object?> get props => [sum];
}
