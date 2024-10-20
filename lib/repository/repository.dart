import 'dart:convert';

import 'package:chopper_sample/models/news.dart';
import 'package:chopper_sample/searvise/api_client.dart';

class Repository {
  Future<List<News>> getNews() {
    return ApiClient.create().getNews().then((value) {
      final list = json.decode(value.body) as List<dynamic>;
      final result = List<News>.from(list.map((e) => News.fromJson(e)));
      return result;
    });
  }
}
