import 'package:flutter/foundation.dart';

extension ExtensionUInt8List on String {
  Uint8List get toUInt8List => Uint8List.fromList(codeUnits);
}

extension ExtensionStringModifiers on String {
  get withDoubleDots => '$this:';
}
