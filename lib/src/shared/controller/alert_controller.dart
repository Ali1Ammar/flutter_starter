import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/config/style.dart';
import 'package:starter/src/main/route.dart';
import 'package:starter/src/shared/exception/error_simplify.dart';
import 'package:starter/src/shared/extention/extention.dart';

final alertProvider = Provider((ref) => AlertController(ref));

class AlertController {
  final Ref ref;
  BuildContext get context =>
      ref.read(appRouterProvider).navigatorKey.currentContext!;
  AlertController(this.ref);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? controller;
  showErrorSnackbar(String error, [BuildContext? context]) {
    try {
      controller?.close();
    } catch (e) {
      //
    }
    controller =
        ScaffoldMessenger.of(context ?? this.context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 3000),
            content: Text(
              error,
              maxLines: 1,
            )));
  }

  showDone(String alert, [BuildContext? context]) {
    try {
      controller?.close();
    } catch (e) {
      //
    }
    controller =
        ScaffoldMessenger.of(context ?? this.context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 1000),
            backgroundColor: Coloring.primaryColor,
            content: Text(
              alert,
              maxLines: 1,
            )));
  }

  showSimplifyErrorSnackbar(Object error, [BuildContext? context]) {
    final translator = (context ?? this.context).translator;
    showErrorSnackbar(errorSimplify(error, translator), context);
  }

  showDialogError(String title, String content, [BuildContext? context]) {
    showDialog(
        context: context ?? this.context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        });
  }
}
