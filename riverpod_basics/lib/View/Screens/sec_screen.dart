import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../Container/Pods/home_pods.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.data});

  final String data;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(widget.data)),
            Consumer(
              builder: (context, ref, child) {
                final model = ref.watch(userNotifierProvider);
                return SizedBox(
                  width: size.width,
                  height: size.height * 0.9,
                  child: model.isEmpty
                      ? Center(
                          child: TextButton(
                            onPressed: () {
                              ref
                                  .read(userNotifierProvider.notifier)
                                  .addUser("Hello", 10);
                            },
                            child: const Text("Add Someone"),
                          ),
                        )
                      : ListView.builder(
                          itemCount: model.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(model[0].name),
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(userNotifierProvider.notifier)
                                          .addUser("Hello", 10);
                                    },
                                    child: Text(model[0].height.toString())),
                              ],
                            );
                          }),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
