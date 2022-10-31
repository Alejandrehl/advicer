import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:dio/dio.dart';

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final Dio dio;

  AdviceRemoteDatasourceImpl({
    required this.dio,
  });

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await dio.get('/advice');

    if (response.statusCode != 200) {
      throw ServerException();
    }

    return AdviceModel.fromJson(response.data);
  }
}
