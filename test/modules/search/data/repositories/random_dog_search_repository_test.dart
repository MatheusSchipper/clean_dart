import 'package:clean_dart/modules/search/data/interfaces/random_dog_search_datasource_interface.dart';
import 'package:clean_dart/modules/search/data/models/result_random_dog_search_model.dart';
import 'package:clean_dart/modules/search/data/repositories/random_dog_search_repository.dart';
import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RandomDogSearchDatasourceMock extends Mock
    implements IRandomDogSearchDatasource {}

main() {
  final datasource = RandomDogSearchDatasourceMock();

  final repository = RandomDogSearchRepository(datasource);

  test(
    'should return a ResultRandomDogSearch',
    () async {
      // Arrange
      when(datasource.getRandomSearch())
          .thenAnswer((_) async => ResultRandomDogSearchModel());
      // Act
      final result = await repository.search();
      //Assert
      expect(result | null, isA<ResultRandomDogSearch>());
    },
  );

  test(
    'should return an DatasourceError when datasource fails',
    () async {
      // Arrange
      when(datasource.getRandomSearch()).thenThrow(Exception());
      // Act
      final result = await repository.search();
      //Assert
      expect(result.fold(id, id), isA<DatasourceError>());
    },
  );
}
