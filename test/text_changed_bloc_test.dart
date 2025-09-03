import 'package:bloc_test/bloc_test.dart';
import 'package:bunch_of_tasks/fifth/text_change_bloc.dart';
import 'package:bunch_of_tasks/fifth/text_changed_event.dart';
import 'package:bunch_of_tasks/fifth/text_changed_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextChangedBloc test', () {
    late TextChangedBloc textChangedBloc;

    setUp(() {
      textChangedBloc = TextChangedBloc();
    });

    tearDown(() {
      textChangedBloc.close();
    });

    blocTest<TextChangedBloc, ContentChangedState>(
      'несколько быстрых изменений → сохраняется только последнее',
      build: () => TextChangedBloc(),
      act: (bloc) async {
        bloc.add(ContentChanged(content: 'a'));
        bloc.add(ContentChanged(content: 'ab'));
        await Future.delayed(const Duration(milliseconds: 900));
        bloc.add(ContentChanged(content: 'abc'));

      },
      expect: () => [
        const ContentChangedState(content: 'abc'),
      ],
    );

    blocTest<TextChangedBloc, ContentChangedState>(
      'одно изменение → сохраняется оно же',
      build: () => TextChangedBloc(),
      act: (bloc) async {
        bloc.add(ContentChanged(content: 'hel'));
        await Future.delayed(const Duration(milliseconds: 1100));
        bloc.add(ContentChanged(content: 'hello'));
      },
      expect: () => [
        const ContentChangedState(content: 'hel'),
        const ContentChangedState(content: 'hello'),
      ],
    );
  });
}
