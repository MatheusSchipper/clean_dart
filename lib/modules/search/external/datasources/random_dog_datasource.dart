import 'package:clean_dart/modules/search/data/interfaces/random_dog_search_datasource_interface.dart';
import 'package:clean_dart/modules/search/data/models/result_random_dog_search_model.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/utils/constants.dart';
import 'package:dio/dio.dart';

class RandomDogDatasource implements IRandomDogSearchDatasource {
  final Dio dio;

  RandomDogDatasource(this.dio);
  @override
  Future<ResultRandomDogSearchModel> getRandomSearch() async {
    final response = await dio.get(urlRandomDog);
    if (response.statusCode == 200) {
      final model = ResultRandomDogSearchModel.fromMap(response.data);
      return model;
    } else {
      throw DatasourceError();
    }
  }
}
