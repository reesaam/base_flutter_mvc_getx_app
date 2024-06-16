import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/resources/app_icons.dart';
import '../../app_localization.dart';

extension IconFunction on int? {
  Icon get toIcon => this == null ? AppIcons.none : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}

extension Currency on int {
  String get toCurrency => NumberFormat.decimalPattern(AppLocalization.english.toString()).format(this);
}

extension CurrencyNull on int? {
  String get toCurrency => NumberFormat.decimalPattern(AppLocalization.english.toString()).format(this);
}
