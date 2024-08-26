import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'extension_int.dart';

extension ExtensionUInt8List on String {
  Uint8List get toUInt8List => Uint8List.fromList(codeUnits);
}

extension ExtensionStringModifiers on String {
  String get withDoubleDots => '$this:';
}

extension ExtensionStringModifiersCurrency on String {
  String get toCurrency => int.tryParse(this).toCurrency;
  String toCurrencyWithSign(String sign) => int.tryParse(this).toCurrencyWithSign(sign);
}
