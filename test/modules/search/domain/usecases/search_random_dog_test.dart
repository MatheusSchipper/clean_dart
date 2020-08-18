import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';
import 'package:clean_dart/modules/search/domain/interfaces/random_dog_search_repository_interface.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_random_dog.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRandomDogRepositoryMock extends Mock
    implements IRandomDogSearchRepository {}

main() {
  final repository = SearchRandomDogRepositoryMock();
  final usecase = SearchRandomDog(repository);
  test(
    'should return an ResultRandomDogSearch',
    () async {
      // Arrange
      when(repository.search())
          .thenAnswer((_) async => Right(ResultRandomDogSearch()));
      // Act
      final result = await usecase();
      //Assert
      expect(result | null, isA<ResultRandomDogSearch>());
    },
  );
}
