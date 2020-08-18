import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';
import 'package:clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:clean_dart/modules/search/domain/errors/errors.dart';

abstract class ISearchState {}

class SuccessSearchState implements ISearchState {
  final List<ResultSearch> list;

  SuccessSearchState(this.list);
}

class SuccessRandomDogSearch implements ISearchState {
  final ResultRandomDogSearch entity;

  SuccessRandomDogSearch(this.entity);
}

class ErrorSearchState implements ISearchState {
  final FailureSearch error;

  ErrorSearchState(this.error);
}

class LoadingSearchState implements ISearchState {}

class StartSearchState implements ISearchState {}
