import 'package:clean_dart/modules/search/data/interfaces/search_datasource_interface.dart';
import 'package:clean_dart/modules/search/data/models/result_search_model.dart';
import 'package:clean_dart/modules/search/data/repositories/search_repository.dart';
import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements ISearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();

  final repository = SearchRepository(datasource);

  test(
    'should return an ResultSearch list',
    () async {
      // Arrange
      when(datasource.getSearch(any))
          .thenAnswer((_) async => <ResultSearchModel>[]);
      // Act
      final result = await repository.search("searchText");
      //Assert
      expect(result | null, isA<List<ResultSearch>>());
    },
  );

  test(
    'should return an DatasourceError when datasource fails',
    () async {
      // Arrange
      when(datasource.getSearch(any)).thenThrow(Exception());
      // Act
      final result = await repository.search("searchText");
      //Assert
      expect(result.fold(id, id), isA<DatasourceError>());
    },
  );
}
