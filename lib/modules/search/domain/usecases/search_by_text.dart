import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/domain/interfaces/search_repository_interface.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByText implements ISearchByText {
  final ISearchRepository repository;

  SearchByText(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty)
      return Left(InvalidTextError());
    return repository.search(searchText);
  }
}
