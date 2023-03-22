import 'package:flutter/material.dart';
import 'package:starter/src/main/route.dart';
import 'package:starter/src/shared/extention/extention.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translator.setting),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                context
                    .read(appRouterProvider)
                    .push(SettingRoute(justSomeParam: "param"));
              },
              child: Text(context.translator.setting)),
          TextButton(
              onPressed: () {
                context.read(appRouterProvider).push(DetialsRoute(id: 5));
              },
              child: Text(context.translator.setting))
        ],
      ),
    );
  }
}
