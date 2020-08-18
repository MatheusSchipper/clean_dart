import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class IRandomDogSearchRepository {
  Future<Either<FailureSearch, ResultRandomDogSearch>> search();
}
