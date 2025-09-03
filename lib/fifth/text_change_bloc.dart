import 'package:bunch_of_tasks/fifth/text_changed_event.dart';
import 'package:bunch_of_tasks/fifth/text_changed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class TextChangedBloc extends Bloc<ContentChanged, ContentChangedState> {
  TextChangedBloc() : super(ContentChangedState(content: '')) {
    on<ContentChanged>(_onContentChanged, transformer: debounceTransformer());
  }

  void _onContentChanged(
    ContentChanged event,
    Emitter<ContentChangedState> emit,
  ) {
    emit(ContentChangedState(content: event.content));
  }

  EventTransformer<E> debounceTransformer<E>() =>
      (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 1000))
          .flatMap(mapper);
}
