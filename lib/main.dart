import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_notifier/hydrated_notifier.dart';

import 'src/main/app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  var appDir = await getApplicationDocumentsDirectory();

  HydratedStateNotifier.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : appDir,
  );
  runApp(const MyApp());
}
