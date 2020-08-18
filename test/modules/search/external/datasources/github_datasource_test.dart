import 'dart:convert';

import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();

  final datasource = GithubDatasource(dioMock);
  test(
    'should return an ResultSearchModel list',
    () async {
      // Arrange
      when(dioMock.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(githubResponse), statusCode: 200));
      // Act
      final futureResult = datasource.getSearch("searchText");
      //Assert
      expect(futureResult, completes);
    },
  );

  test(
    'should return an Error if status code isnt 200',
    () async {
      // Arrange
      when(dioMock.get(any))
          .thenAnswer((_) async => Response(data: null, statusCode: 401));
      // Act
      final futureResult = datasource.getSearch("searchText");
      //Assert
      expect(futureResult, throwsA(isA<DatasourceError>()));
    },
  );

  test(
    'should return an Exception if dio throws an error',
    () async {
      // Arrange
      when(dioMock.get(any)).thenThrow(Exception());
      // Act
      final futureResult = datasource.getSearch("searchText");
      //Assert
      expect(futureResult, throwsA(isA<Exception>()));
    },
  );
}
