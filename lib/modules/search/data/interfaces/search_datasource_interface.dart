import 'package:clean_dart/modules/search/data/models/result_search_model.dart';

abstract class ISearchDatasource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
