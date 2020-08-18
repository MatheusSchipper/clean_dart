import 'package:clean_dart/modules/search/data/interfaces/search_datasource_interface.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/interfaces/search_repository_interface.dart';
import 'package:dartz/dartz.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDatasource datasource;

  SearchRepository(this.datasource);
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
