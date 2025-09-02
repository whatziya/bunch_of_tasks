import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

final class QueryChanged  extends SearchEvent {
  final String query;
  const QueryChanged(this.query);
  @override
  List<Object?> get props => [query];

}