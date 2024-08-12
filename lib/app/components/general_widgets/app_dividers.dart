import 'package:flutter/material.dart';

import '../../../data/resources/app_paddings.dart';

class AppDividers {
  static Widget get general => Divider();

  static Widget generalText({required String text}) => Stack(alignment: Alignment.center, children: [
        Divider(),
        Container(padding: AppPaddings.buttonXLarge, child: Text(text)),
      ]);

  static Widget generalTextPrimaryColor({required String text}) => Stack(alignment: Alignment.center, children: [
        Divider(),
        Container(padding: AppPaddings.buttonXLarge, child: Text(text, style: TextStyle())),
      ]);

  static Widget get generalPrimaryColor => Divider();

  static Widget get settings => Divider();
}
