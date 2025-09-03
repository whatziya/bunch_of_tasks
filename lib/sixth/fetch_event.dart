import 'package:equatable/equatable.dart';

class FetchData extends Equatable {
  final String smth;

  const FetchData({required this.smth});
  @override
  List<Object?> get props => [smth];
}
