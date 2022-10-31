import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource;

  AdviceRepoImpl({
    required this.adviceRemoteDatasource,
  });

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on CacheException catch (_) {
      return left(CacheFailure());
    } on DioError catch (_) {
      return left(GeneralFailure());
    }
  }
}
