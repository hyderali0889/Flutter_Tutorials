import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basics/Container/Pods/home_pods.dart';
import 'package:riverpod_basics/Model/post_model.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(postProvider).when(data: (data) {
      return Scaffold(
          body: ListView.builder(
              itemCount: ref.watch(postProvider).value!.length,
              itemBuilder: (context, index) {
                List<PostModel>? list = ref.watch(postProvider).value;

                return Text(list![index].title);
              }));
    }, error: (error, stacktrace) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
