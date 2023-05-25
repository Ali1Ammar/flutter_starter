import 'package:flutter/foundation.dart';

logIt(Object? text) {
  // ignore: avoid_print
  print(text);
}

Future<void> recordError(dynamic exception, StackTrace? stack,
    {dynamic reason,
    Iterable<Object> information = const [],
    bool printDetails = true,
    bool fatal = false}) async {
  if (kDebugMode) {
    print(exception);
    print(stack);
    return;
  }
}
