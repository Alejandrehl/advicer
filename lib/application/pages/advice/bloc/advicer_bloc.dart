import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      // Execute business logic
      // For example get an advice
      debugPrint('Fake Advice Triggered');
      await Future.delayed(const Duration(seconds: 3));
      debugPrint('Got advice');

      emit(AdvicerStateLoaded(advice: 'Fake advice to test BLoC'));
    });
  }
}
