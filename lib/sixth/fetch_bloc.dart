import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bunch_of_tasks/sixth/fetch_event.dart';
import 'package:bunch_of_tasks/sixth/fetch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBloc extends Bloc<FetchData, FetchState> {
  FetchBloc() : super(FetchState(smth: 'init')) {
    on<FetchData>(_onFetchData, transformer: droppable());
  }

  void _onFetchData(FetchData event, Emitter<FetchState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(FetchState(smth: event.smth));
  }
}
