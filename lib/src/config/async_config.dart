import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final asyncConfigProvider =
    Provider<AsyncConfig>((ref) => throw UnimplementedError());

// we use this to await(at main.dart) any global needed config value like path provider, device into, package info and other and then provide this value to the app using provider override
class AsyncConfig {
  late final Directory appDir;
  late final Directory tmpDir;
  AsyncConfig._();
  static Future<AsyncConfig> init() async {
    final pathValue = AsyncConfig._();
    final appDir = await getApplicationDocumentsDirectory();
    final tmpDir = await getTemporaryDirectory();
    pathValue.appDir = appDir;
    pathValue.tmpDir = tmpDir;
    return pathValue;
  }
}
