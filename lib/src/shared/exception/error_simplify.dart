import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:starter/src/shared/exception/base_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starter/src/shared/helper/log.dart';

String errorSimplify(Object error, AppLocalizations localizations) {
  if (error is BaseException) {
    return error.translate(localizations);
  }
  if (error is DioError) {
    if (error.error is BaseException) {
      return (error.error as BaseException).translate(localizations);
    }
  }
  if (!kDebugMode) logIt(error);
  return error.toString();
}
