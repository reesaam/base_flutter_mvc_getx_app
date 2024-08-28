import 'package:flutter/foundation.dart';

import 'extension_int.dart';

extension ExtensionUInt8List on String {
  Uint8List get toUInt8List => Uint8List.fromList(codeUnits);
}

extension ExtensionStringModifiers on String {
  String get withDoubleDots => '$this:';
}

extension ExtensionStringModifiersCurrency on String {
  String toCurrency({String? sign}) => int.tryParse(this).toCurrency(sign: sign);
}
