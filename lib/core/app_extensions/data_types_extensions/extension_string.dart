import 'package:flutter/foundation.dart';

extension UInt8List on String {
  Uint8List get toUInt8List => Uint8List.fromList(codeUnits);
}

extension StringModifiers on String {
  get withDoubleDots => '$this:';
}
