import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_widgets.dart';
import '../../../data/resources/app_elements.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_text_styles.dart';
import '../buttons/app_general_button.dart';
import '../general_widgets/app_dividers.dart';

class AppAlertDialogs {
  _onTapCancel() => popPage();

  withYesNo({String? title, required String text, required Function() onTapYes, Function()? onTapNo, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.no, onTap: onTapNo ?? _onTapCancel),
      AppGeneralButton(text: Texts.to.yes, primaryColor: true, onTap: onTapYes),
    ];
    await _appAlertDialog(title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  withOkCancel({String? title, required String text, required Function() onTapOk, Function()? onTapCancel, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.cancel, onTap: onTapCancel ?? _onTapCancel),
      AppGeneralButton(text: Texts.to.ok, primaryColor: true, onTap: onTapOk),
    ];
    await _appAlertDialog(title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  withOk({String? title, required String text, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, primaryColor: true, onTap: onTapOk),
    ];
    await _appAlertDialog(title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  _appAlertDialog({
    String? title,
    required String text,
    required List<Widget> buttons,
    bool? dismissible,
  }) async =>
      await showDialog(
          context: Get.context!,
          useSafeArea: true,
          useRootNavigator: true,
          barrierDismissible: dismissible ?? false,
          builder: (context) => Container(
            padding: AppPaddings.generalAlertDialog,
            child: AlertDialog.adaptive(
                  scrollable: true,
                  shape: AppElements.borderShapeAlertDialog,
                  title: title == null
                      ? shrinkSizedBox
                      : Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(title),
                          AppDividers.generalPrimaryColor,
                        ]),
                  content: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Text(text),
                      ])),
                  actions: _renderButtonsAlertDialog(buttons),
                  actionsOverflowAlignment: OverflowBarAlignment.center,
                  actionsOverflowDirection: VerticalDirection.down,
                  actionsAlignment: MainAxisAlignment.center,
                ),
          ));

  List<Widget> _renderButtonsAlertDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(Expanded(flex: length > 1 ? (30 ~/ length) : 2, child: buttons[i]));
      list.add(i == length - 1 ? shrinkOneExpanded : shrinkExpanded(2));
    }
    return [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list)];
  }
}
