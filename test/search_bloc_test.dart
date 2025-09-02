import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/second/bloc/search_bloc.dart';
import 'package:bunch_of_tasks/second/bloc/search_event.dart';
import 'package:bunch_of_tasks/second/bloc/search_state.dart';
import 'package:bunch_of_tasks/second/utils/custom_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchBloc debounce', () {
    late SearchBloc searchBloc;

    setUp(() {
      searchBloc = SearchBloc();
    });

    tearDown(() {
      searchBloc.close();
    });

    blocTest<SearchBloc, SearchState>(
      'emits filtered list when query is stable',
      build: () => searchBloc,
      act: (bloc) async {
        bloc.add(QueryChanged('A'));
        await Future.delayed(const Duration(milliseconds: 400));
      },
      expect: () => [
        SearchResult(
          result: customNames.where((e) => e.name.contains('A')).toList(),
        ),
      ],
    );

    blocTest(
      'debounce correct working',
      build: () => searchBloc,
      act: (bloc) async {
        bloc.add(QueryChanged(''));
        bloc.add(QueryChanged('Ar'));
        await Future.delayed(const Duration(milliseconds: 300));
      },
      expect: () => [
        SearchResult(
          result: customNames.where((e) => e.name.contains('Ar')).toList(),
        ),
      ],
    );
  });
}
