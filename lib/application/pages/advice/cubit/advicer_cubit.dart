import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final adviceUseCases = AdviceUseCases();

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    final failureOrAdvice = await adviceUseCases.getAdvice();

    failureOrAdvice.fold(
      (failure) => emit(AdvicerStateError(
        message: _mapFailureToMessage(failure),
      )),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ups, API Error, please try again';
      case CacheFailure:
        return 'Ups, cache failed. Please try again.';
      default:
        return 'Ups, something gone wrong. Please try again.';
    }
  }
}
