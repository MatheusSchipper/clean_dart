import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart/modules/search/presenter/search/blocs/github_search_bloc.dart';
import 'package:clean_dart/modules/search/presenter/search/states/state.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements ISearchByText {}

main() {
  final usecase = SearchByTextMock();

  final bloc = GithubSearchBloc(usecase);

  test(
    'should return states on correct order',
    () async {
      // Arrange
      when(usecase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
      // Act

      //Assert
      expect(
        bloc,
        emitsInOrder([
          isA<LoadingSearchState>(),
          isA<SuccessSearchState>(),
        ]),
      );
      bloc.add("event");
    },
  );

  test(
    'should return an error',
    () async {
      // Arrange
      when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));
      // Act

      //Assert
      expect(
        bloc,
        emitsInOrder([
          isA<LoadingSearchState>(),
          isA<ErrorSearchState>(),
        ]),
      );
      bloc.add("event");
    },
  );
}
