import 'package:chopper_sample/models/news.dart';
import 'package:chopper_sample/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => Repository());

final listProvider = FutureProvider<List<News>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.getNews();
});
