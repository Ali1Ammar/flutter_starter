import 'package:auto_route/auto_route.dart';
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
                context
                    .read(appRouterProvider)
                    .push(SettingRoute(justSomeParam: "param"));
              },
              child: Text(context.translator.setting)),
          TextButton(
              onPressed: () {
                context.read(appRouterProvider).push(DetialsRoute(id: 5));
              },
              child: Text("detials"))
        ],
      ),
    );
  }
}
