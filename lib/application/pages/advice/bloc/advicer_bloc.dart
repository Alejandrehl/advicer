import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/usecases/advice_usecases.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again.';
const serverFailureMessage = 'Ups, API Error, please try again';
const cacheFailureMessage = 'Ups, cache failed. Please try again.';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  final adviceUseCases = AdviceUseCases();

  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      final failureOrAdvice = await adviceUseCases.getAdvice();

      failureOrAdvice.fold(
        (failure) =>
            emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
