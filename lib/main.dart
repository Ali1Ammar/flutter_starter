import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:starter/src/main/async_init.dart';

import 'src/main/app.dart';

void main() async {
  await Hive.initFlutter();
  final asyncConfig = await AsyncInit.init();
  runApp(MyApp(
    asyncConfig: asyncConfig,
  ));
}
