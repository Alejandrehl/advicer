import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final adviceUseCases = AdviceUseCases();

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    final advice = await adviceUseCases.getAdvice();

    emit(AdvicerStateLoaded(advice: advice.advice));
  }
}
