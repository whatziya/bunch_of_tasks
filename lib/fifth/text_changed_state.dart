import 'package:equatable/equatable.dart';

class ContentChangedState extends Equatable{
  final String content;

  const ContentChangedState({required this.content});
  @override
  List<Object?> get props => [content];

}