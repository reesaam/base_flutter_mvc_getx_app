import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/resources/app_icons.dart';
import '../../app_localization.dart';

extension ExtensionIconFunction on int? {
  Icon get toIcon => this == null ? AppIcons.none : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}

extension ExtensionCurrencyFormat on int {
  String get toCurrency => NumberFormat.decimalPattern(AppLocalization.english.toString()).format(this);
}

extension ExtensionCurrencyFormatNull on int? {
  String get toCurrency => NumberFormat.decimalPattern(AppLocalization.english.toString()).format(this);
}
