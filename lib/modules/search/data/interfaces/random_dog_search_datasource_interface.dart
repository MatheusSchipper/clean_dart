import 'package:clean_dart/modules/search/data/models/result_random_dog_search_model.dart';

abstract class IRandomDogSearchDatasource {
  Future<ResultRandomDogSearchModel> getRandomSearch();
}
