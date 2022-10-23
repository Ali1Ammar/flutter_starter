import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_notifier/hydrated_notifier.dart';
import 'package:khana/src/config/async_config.dart';

import 'src/main/app.dart';

void main() async {
  await Hive.initFlutter();
  final asyncConfig = await AsyncConfig.init();
  HydratedStateNotifier.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorage.webStorageDirectory : asyncConfig.appDir,
  );
  runApp(MyApp(
    asyncConfig: asyncConfig,
  ));
}
