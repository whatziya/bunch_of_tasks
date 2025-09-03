import 'package:equatable/equatable.dart';

class AddNUmber extends Equatable {
  final int value;

  const AddNUmber({required this.value});

  @override
  List<Object?> get props => [value];
}
