import 'package:advicer/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/repositories/advice_repo.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'application/pages/advice/cubit/advicer_cubit.dart';

final sl = GetIt.I; // sl = Service Locator

Future<void> init() async {
  // ! Application Layer
  // Factory = Every time a new/fresh instance of the class

  sl.registerFactory(() => AdvicerBloc(adviceUseCases: sl()));
  sl.registerFactory(() => AdvicerCubit(adviceUseCases: sl()));

  // ! Domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  // ! Data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(dio: sl()));

  // ! Extern
  final dio = Dio();
  dio.options.baseUrl = 'https://api.flutter-community.com/api/v1';
  dio.options.headers = {
    'content-type': 'application/json',
  };
  sl.registerFactory(() => dio);
}
