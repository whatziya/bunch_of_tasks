import 'package:equatable/equatable.dart';

class ContentChanged extends Equatable {
  final String content;

  const ContentChanged({required this.content});

  @override
  List<Object?> get props => [content];
}
