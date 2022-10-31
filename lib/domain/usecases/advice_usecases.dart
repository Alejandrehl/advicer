import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;

  AdviceUseCases({
    required this.adviceRepo,
  });

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
