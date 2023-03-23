import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/shared/extention/extention.dart';

abstract class BaseException {
  String translate(AppLocalizations tr);
  String translateContext(BuildContext context) =>
      translate(context.translator);
  String translateRef(Ref ref) => translate(ref.read(translatorProvider));
}
