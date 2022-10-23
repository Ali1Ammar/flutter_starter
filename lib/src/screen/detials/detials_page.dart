import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khana/src/screen/detials/detials_controller.dart';

class DetialsPage extends ConsumerWidget {
  final int id;
  const DetialsPage({super.key, @pathParam required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detialsProvider);
    return Scaffold(
      body: Column(
        children: [Text(state.toString())],
      ),
    );
  }
}
