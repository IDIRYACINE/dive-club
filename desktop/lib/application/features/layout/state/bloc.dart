import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';
import 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initialState()) {
    on<AppNavigate>(_handleNavigate);
  }

  FutureOr<void> _handleNavigate(AppNavigate event, Emitter<AppState> emit) {
    emit(state.copyWith(selectedIndex: event.uniqueId));
  }
}
