import 'dart:convert';

import 'package:clean_dart/modules/search/domain/entities/result_random_dog_search.dart';

class ResultRandomDogSearchModel extends ResultRandomDogSearch {
  final String url;

  ResultRandomDogSearchModel({this.url});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory ResultRandomDogSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultRandomDogSearchModel(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultRandomDogSearchModel.fromJson(String source) =>
      ResultRandomDogSearchModel.fromMap(json.decode(source));
}
