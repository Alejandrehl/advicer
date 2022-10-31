import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:dio/dio.dart';

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final _dio = Dio();

  AdviceRemoteDatasourceImpl() {
    _dio.options.baseUrl = 'https://api.flutter-community.com/api/v1';
    _dio.options.headers = {
      'content-type': 'application/json',
    };
  }

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await _dio.get('/advice');

    if (response.statusCode != 200) {
      throw ServerException();
    }

    return AdviceModel.fromJson(response.data);
  }
}
