import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/advice_usecases.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  final adviceUseCases = AdviceUseCases();

  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      final advice = await adviceUseCases.getAdvice();

      emit(AdvicerStateLoaded(advice: advice));
    });
  }
}
