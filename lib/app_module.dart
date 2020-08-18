import 'package:clean_dart/app_widget.dart';
import 'package:clean_dart/modules/search/data/repositories/random_dog_search_repository.dart';
import 'package:clean_dart/modules/search/data/repositories/search_repository.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_random_dog.dart';
import 'package:clean_dart/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_dart/modules/search/external/datasources/random_dog_datasource.dart';
import 'package:clean_dart/modules/search/presenter/search/blocs/github_search_bloc.dart';
import 'package:clean_dart/modules/search/presenter/search/blocs/random_dog_search_bloc.dart';
import 'package:clean_dart/modules/search/presenter/search/pages/home_page.dart';
import 'package:clean_dart/modules/search/presenter/search/pages/random_dog_search_page.dart';
import 'package:clean_dart/modules/search/utils/constants.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/presenter/search/pages/github_search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => RandomDogDatasource(i())),
        Bind((i) => SearchRepository(i())),
        Bind((i) => RandomDogSearchRepository(i())),
        Bind((i) => SearchByText(i())),
        Bind((i) => SearchRandomDog(i())),
        Bind((i) => GithubSearchBloc(i())),
        Bind((i) => RandomDogSearchBloc(i())),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, __) => HomePage(),
        ),
        Router(
          githubRoute,
          child: (_, __) => GithubSearchPage(),
        ),
        Router(
          randomDogRoute,
          child: (_, __) => RandomDogSearchPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
