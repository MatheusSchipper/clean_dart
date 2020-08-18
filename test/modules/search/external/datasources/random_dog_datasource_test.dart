import 'dart:convert';

import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/external/datasources/random_dog_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/random_dog_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dioMock = DioMock();
  final datasource = RandomDogDatasource(dioMock);

  test(
    'should return a ResultRandomDogSearch',
    () async {
      // Arrange
      when(dioMock.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(randomDogResponse), statusCode: 200));
      // Act
      final futureResult = datasource.getRandomSearch();
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
      final futureResult = datasource.getRandomSearch();
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
      final futureResult = datasource.getRandomSearch();
      //Assert
      expect(futureResult, throwsA(isA<Exception>()));
    },
  );
}
