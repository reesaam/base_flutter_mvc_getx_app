import 'package:flutter/material.dart';

import '../../../data/resources/app_paddings.dart';

class AppDividers {
  static Widget get general => Divider();

  static Widget generalText({required String text}) => Stack(alignment: Alignment.center, children: [
        general,
        Container(padding: AppPaddings.buttonXLarge, child: Text(text)),
      ]);

  static Widget generalTextPrimaryColor({required String text}) => Stack(alignment: Alignment.center, children: [
        general,
        Container(padding: AppPaddings.buttonXLarge, child: Text(text, style: TextStyle())),
      ]);

  static Widget get generalPrimaryColor => general;

  static Widget get settings => general;
}
