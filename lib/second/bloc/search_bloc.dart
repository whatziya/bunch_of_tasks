import 'package:bunch_of_tasks/second/bloc/search_event.dart';
import 'package:bunch_of_tasks/second/bloc/search_state.dart';
import 'package:bunch_of_tasks/second/utils/custom_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchResult(result: customNames)) {
    on<QueryChanged>(
      _onQueryChanged,
      transformer: debounceTransformer(const Duration(milliseconds: 300)),
    );
  }

  void _onQueryChanged(QueryChanged event, Emitter<SearchState> emit) {
    final result = customNames
        .where((element) => element.name.contains(event.query))
        .toList();
    emit(SearchResult(result: result));
  }

  EventTransformer<E> debounceTransformer<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
