import 'dart:convert';

import 'package:clean_dart/app_module.dart';
import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);
  test(
    'should recover usecase without error',
    () async {
      // Arrange

      // Act
      final usecase = Modular.get<ISearchByText>();
      //Assert
      expect(usecase, isA<ISearchByText>());
      expect(usecase, isA<SearchByText>());
    },
  );

  test(
    'should bring a ResultSearch list',
    () async {
      // Arrange
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(githubResponse),
          statusCode: 200,
        ),
      );
      // Act
      final usecase = Modular.get<ISearchByText>();
      final result = await usecase("Jacob");
      //Assert
      expect(result | null, isA<List<ResultSearch>>());
    },
  );
}
