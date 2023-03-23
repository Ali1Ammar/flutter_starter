import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:starter/src/shared/exception/base_exception.dart';

abstract class NetworkException extends BaseException {}

class BadNetworkException extends NetworkException {
  @override
  String translate(AppLocalizations tr) {
    return tr.noInternet;
  }
}

class KnownDioException extends NetworkException {
  final Response error;
  KnownDioException(this.error);

  @override
  String translate(AppLocalizations tr) {
    switch (error.data['code']) {
      case "NotFound":
        return tr.notFound;
      default:
        return tr.noInternet;
    }
  }
}

class UnAuthorizeException extends NetworkException {
  @override
  String translate(AppLocalizations tr) {
    return tr.unauthraizeError;
  }
}

class UnKnownNetworkException extends NetworkException {
  @override
  String translate(AppLocalizations tr) {
    return tr.noInternet;
  }
}
