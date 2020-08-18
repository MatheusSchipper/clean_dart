import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/domain/interfaces/random_dog_search_repository_interface.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRandomDog {
  Future<Either<FailureSearch, ResultRandomDogSearch>> call();
}

class SearchRandomDog implements ISearchRandomDog {
  final IRandomDogSearchRepository repository;

  SearchRandomDog(this.repository);

  @override
  Future<Either<FailureSearch, ResultRandomDogSearch>> call() {
    return repository.search();
  }
}
