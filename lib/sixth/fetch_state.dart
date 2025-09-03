import 'package:equatable/equatable.dart';

class FetchState extends Equatable {
  final String smth;

  const FetchState({required this.smth});

  @override
  List<Object?> get props => [smth];
}
