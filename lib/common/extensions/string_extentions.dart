import 'package:flutter/cupertino.dart';
import 'package:petshop/presentation/app_localizations.dart';

extension StringExtensions on String {
  String intelliTrim() {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
