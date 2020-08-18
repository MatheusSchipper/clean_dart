import 'package:clean_dart/modules/search/data/interfaces/random_dog_search_datasource_interface.dart';
import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/domain/interfaces/random_dog_search_repository_interface.dart';
import 'package:dartz/dartz.dart';

class RandomDogSearchRepository implements IRandomDogSearchRepository {
  final IRandomDogSearchDatasource datasource;

  RandomDogSearchRepository(this.datasource);
  @override
  Future<Either<FailureSearch, ResultRandomDogSearch>> search() async {
    try {
      final result = await datasource.getRandomSearch();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
