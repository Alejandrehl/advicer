import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    await Future.delayed(const Duration(seconds: 3));

    emit(AdvicerStateLoaded(advice: 'Fake advice to test BLoC'));
  }
}
