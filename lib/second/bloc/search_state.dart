import 'package:equatable/equatable.dart';
import 'package:bunch_of_tasks/second/utils/custom_data.dart';

sealed class SearchState extends Equatable {
  const SearchState({required this.result});

  final List<CustomName> result;

  @override
  List<Object?> get props => [result];
}

final class SearchResult extends SearchState {
  const SearchResult({required super.result});
}
