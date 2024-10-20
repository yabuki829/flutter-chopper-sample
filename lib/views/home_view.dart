import 'package:chopper_sample/models/news.dart';
import 'package:chopper_sample/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(listProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('News List')),
      body: Center(
        child: asyncValue.when(
          data: (data) {
            return data.isNotEmpty
                ? ListView(
                    children: data
                        .map(
                          (News news) => Card(
                            child: ListTile(
                              title: Text(news.title!),
                              subtitle: Text(news.body!),
                              trailing: const Icon(Icons.more_vert),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const Text('Data is empty.');
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Text(error.toString()),
        ),
      ),
    );
  }
}
