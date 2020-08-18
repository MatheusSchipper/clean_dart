import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/domain/interfaces/search_repository_interface.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByText(repository);

  test(
    'should return an ResultSearch list',
    () async {
      // Arrange
      when(repository.search(any))
          .thenAnswer((_) async => Right(<ResultSearch>[]));
      // Act
      final result = await usecase("teste");
      //Assert
      expect(result | null, isA<List<ResultSearch>>());
    },
  );

  test(
    'should return an exception when searchText is invalid',
    () async {
      // Arrange
      when(repository.search(any))
          .thenAnswer((_) async => Right(<ResultSearch>[]));
      // Act
      var result = await usecase(null);
      //Assert
      expect(result.isLeft(), true);
      expect(result.fold(id, id), isA<InvalidTextError>());

      result = await usecase("");
      expect(result.fold(id, id), isA<InvalidTextError>());
    },
  );
}
