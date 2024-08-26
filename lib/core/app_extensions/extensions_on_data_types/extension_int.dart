import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/resources/app_icons.dart';
import '../../app_localization.dart';

extension ExtensionIconFunction on int? {
  Icon get toIcon => this == null ? AppIcons.none : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}

extension ExtensionCurrencyFormat on int {
  String get toCurrency => NumberFormat.currency(symbol: '', decimalDigits: 0).format(this);
  String toCurrencyWithSign(String sign) => NumberFormat.currency(symbol: sign, decimalDigits: 0).format(this);
}

extension ExtensionCurrencyFormatNull on int? {
  String get toCurrency => this == null ? Texts.to.notAvailableInitials : this!.toCurrency;
  String toCurrencyWithSign(String sign) => this == null ? Texts.to.notAvailableInitials : this!.toCurrencyWithSign(sign);
}
