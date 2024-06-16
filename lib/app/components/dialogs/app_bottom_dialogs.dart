import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_widgets.dart';
import '../../../data/resources/app_elements.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../data/resources/app_text_styles.dart';
import '../buttons/app_general_button.dart';
import '../general_widgets/app_dividers.dart';

class AppBottomDialogs {
  _onTapCancel() => popPage();

  withoutButton({String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withOk({String? title, required Widget form, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [AppGeneralButton(text: Texts.to.ok, onTap: onTapOk)];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withCancel({String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [AppGeneralButton(text: Texts.to.cancel, onTap: _onTapCancel)];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withOkCancel({String? title, required Widget form, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts.to.ok, onTap: () => onTapOk()),
      AppGeneralButton(text: Texts.to.cancel, onTap: () => _onTapCancel()),
    ];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  dialogTappableItem(String text) =>
      LayoutBuilder(builder: (context, constraints) => SizedBox(width: constraints.maxWidth, height: 50, child: Text(text, style: AppTextStyles.accountsTableItemMenuItems)));

  _appBottomDialogGeneral({String? title, required Widget form, required List<Widget> buttons, bool? dismissible}) async => await showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      useRootNavigator: true,
      showDragHandle: true,
      isScrollControlled: true,
      isDismissible: dismissible ?? false,
      shape: AppElements.defaultModalBorderShape,
      builder: (context) => SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
                padding: AppPaddings.generalBottomModal,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    title == null
                        ? shrinkSizedBox
                        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(title ?? '', style: AppTextStyles.modalTitle),
                            AppDividers.generalDividerWithAppDefaultColor,
                            AppSpaces.h10,
                          ]),
                    form,
                  ]),
                  AppSpaces.h40,
                  _renderButtonsBottomDialog(buttons),
                ])),
            AppSpaces.h20,
          ])));

  Widget _renderButtonsBottomDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(Expanded(flex: (20 ~/ length), child: buttons[i]));
      list.add(shrinkOneExpanded);
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list);
  }
}
