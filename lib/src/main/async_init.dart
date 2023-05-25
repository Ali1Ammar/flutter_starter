import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/data/storage/base_storage_service.dart';

final asyncInitProvider =
    Provider<AsyncInit>((ref) => throw UnimplementedError());

// we use this to await(at main.dart) any global needed config value like path provider, device into, package info and other and then provide this value to the app using provider override
class AsyncInit {
  // late final Directory appDir;
  // late final Directory tmpDir;
  late final BaseStorage storage;
  AsyncInit._();
  static Future<AsyncInit> init() async {
    final object = AsyncInit._();
    // object.appDir = await getApplicationDocumentsDirectory();
    // object.tmpDir = await getTemporaryDirectory();
    object.storage = SyncHiveStorage(await Hive.openBox("main_box"));
    return object;
  }
}
