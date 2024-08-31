import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/resources/app_icons.dart';
import '../../app_localization_texts.dart';

extension ExtensionIconFunction on int? {
  Icon toIcon() => this == null ? AppIcons.none : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}

extension ExtensionCurrencyFormat on int {
  String toCurrency({String? sign}) => NumberFormat.currency(symbol: sign, decimalDigits: 0).format(this);
}

extension ExtensionCurrencyFormatNull on int? {
  String toCurrency({String? sign}) => this == null ? Texts.to.notAvailableInitials : this!.toCurrency();
}
