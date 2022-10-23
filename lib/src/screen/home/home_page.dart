import 'package:flutter/material.dart';
import 'package:khana/src/main/route.dart';
import 'package:khana/src/shared/extention/extention.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                context.read(appRouterProvider).push(const SettingRoute());
              },
              child: Text(context.translator.setting))
        ],
      ),
    );
  }
}
