import 'package:flutter/material.dart';

import '../app/components/dialogs/app_alert_widget_dialogs.dart';
import '../data/resources/app_icons.dart';
import 'core_functions.dart';

showErrorDialog({String? title, required String message}) {
  Widget widget = Row(children: [AppIcons.error, Text(message)]);
  AppAlertWidgetDialogs().withOk(widget: widget, onTapOk: popPage);
}
