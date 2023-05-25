import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseStorage {
  Future<void> write(String key, String value);

  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> clearAll() async {}
}

class SecureStorage extends BaseStorage {
  final storage =
      const FlutterSecureStorage(mOptions: MacOsOptions(synchronizable: true));

  @override
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) {
    return storage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}

class AsyncHiveStorage extends BaseStorage {
  final String boxName;
  late final Future<LazyBox<String>> storage;

  AsyncHiveStorage(this.boxName) {
    storage = Hive.openLazyBox(boxName);
  }

  Future initBox() {
    return Hive.openBox(boxName);
  }

  @override
  Future<void> write(String key, String value) async {
    await (await storage).put(key, value);
  }

  @override
  Future<String?> read(String key) async {
    return (await storage).get(key);
  }

  @override
  Future<void> delete(String key) async {
    await (await storage).delete(key);
  }

  @override
  Future<void> clearAll() async {
    (await storage).clear();
    return super.clearAll();
  }
}

class SyncHiveStorage extends BaseStorage {
  final Box<String> storage;

  SyncHiveStorage(this.storage);

  @override
  Future<void> write(String key, String value) async {
    await (storage).put(key, value);
  }

  @override
  Future<String?> read(String key) async {
    return storage.get(key);
  }

  @override
  Future<void> delete(String key) async {
    await (storage).delete(key);
  }
}

abstract class StorageNotifier<T> extends StateNotifier<T?>
    with StorageNotifierMixin<T?> {
  @override
  final BaseStorage storage;
  @override
  final String key;
  StorageNotifier(this.storage, this.key) : super(null);

  @override
  setStateTo(val) {
    state = val;
  }
}

mixin StorageNotifierMixin<T> {
  BaseStorage get storage;
  String get key;
  setStateTo(T? val);

  Future<void> init() async {
    final token = await storage.read(key);
    if (token != null) {
      setStateTo(fromJson(jsonDecode(token)));
    } else {
      setStateTo(null);
    }
  }

  T fromJson(dynamic v);
  dynamic toJson(T v);

  Future<void> setTo(T? val) async {
    if (val == null) {
      await storage.delete(key);
    } else {
      await storage.write(key, jsonEncode(toJson(val)));
    }
    setStateTo(val);
  }
}
