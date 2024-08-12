import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/buttons/app_icon_button.dart';
import '../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../app/components/dialogs/app_alert_widget_dialogs.dart';
import '../../../app/components/dialogs/app_bottom_dialogs.dart';
import '../../../app/components/general_widgets/app_check_box.dart';
import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../app/components/general_widgets/app_popup_menu.dart';
import '../../../app/components/general_widgets/app_popup_menu_item.dart';
import '../../../app/components/general_widgets/app_progress_indicator.dart';
import '../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../app/components/general_widgets/app_switch.dart';
import '../../../app/components/general_widgets/app_text_field.dart';
import '../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../core/app_extensions/widgets_extensions/extension_text.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/models/core_models/app_page_detail/app_page_detail.dart';
import '../../../data/resources/app_enums.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../controller/admin_widget_check_controller.dart';

class AdminWidgetCheckPage extends CoreView<AdminWidgetCheckController> {
  const AdminWidgetCheckPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.general,
        _dividers(),
        _iconButtons(),
        _popUpMenu(),
        _textFields(),
        _generalButtons(),
        _checkBoxes(),
        _switches(),
        _progressIndicators(),
        _alertDialogs(),
        _bottomSheetDialog(),
        _snackBars(),
        _appBar(),
        _bottomNavigationBar(),
        _icons(),
      ]);

  _dividers() => _section([
        _item(name: 'AppDividers General', widget: AppDividers.general),
        _item(primary: true, name: 'AppDividers General PrimaryColor', widget: AppDividers.generalPrimaryColor),
        _item(name: 'AppDividers GeneralText', widget: AppDividers.generalText(text: 'Some Text')),
        _item(primary: true, name: 'AppDividers GeneralText PrimaryColor', widget: AppDividers.generalTextPrimaryColor(text: 'Some Text')),
        _item(name: 'AppDividers Settings', widget: AppDividers.settings),
      ], title: 'Dividers');

  _iconButtons() => _section([
        _item(
            name: 'IconButton\nDefaultColor',
            widget: AppIconButton(
              icon: AppIcons.home,
              text: 'IconButton',
              onTap: controller.functionCalledDialog,
            )),
        _item(
            primary: true,
            name: 'IconButton\nPrimaryColor',
            widget: AppIconButton(
              icon: AppIcons.home,
              text: 'IconButton',
              primaryColor: true,
              onTap: controller.functionCalledDialog,
            )),
      ], isRow: true, title: 'Icon Buttons');

  _popUpMenu() => _section([
        _item(
            name: 'Popup Menu\nDefaultColor',
            widget: AppPopupMenu(
                listItems: List<AppPopupMenuItem>.generate(
                    5,
                    (index) => AppPopupMenuItem(
                          text: 'Popup Menu Item',
                          onTapFunction: controller.functionCalledDialog,
                        )))),
        _item(
            name: 'Popup Menu\nPrimaryColor',
            primary: true,
            widget: AppPopupMenu(
                primaryColorIcon: true,
                listItems: List<AppPopupMenuItem>.generate(
                    5,
                    (index) => AppPopupMenuItem(
                          text: 'Popup Menu Item',
                          onTapFunction: controller.functionCalledDialog,
                        ))))
      ], isRow: true, title: 'Popup Menu');

  _textFields() {
    var textFieldHint = 'Text Field Hint';
    var textFieldLabel = 'Text Field Label';
    var textFieldData = 'Text Field Data';
    TextEditingController ctrl = TextEditingController();
    TextEditingController ctrlWithData = TextEditingController();
    TextEditingController ctrlWithMultipleLinesData = TextEditingController();
    ctrlWithData.text = textFieldData;
    ctrlWithMultipleLinesData.text = '$textFieldData\n$textFieldData\n$textFieldData\n$textFieldData';

    return _section([
      _item(name: 'TextField Editable with Leading Icon', widget: AppTextField(controller: ctrl, hint: textFieldHint, leadingIcon: AppIcons.info)),
      _item(
          name: 'TextField Editable with Prefix and Suffix',
          widget: AppTextField(
              controller: ctrl, hint: textFieldHint, prefixIcon: AppIcons.add, prefixAction: controller.functionCalledDialog, suffixIcon: AppIcons.settings, suffixAction: controller.functionCalledDialog)),
      _item(
          name: 'TextField Not Editable',
          widget: AppTextField(
            editable: false,
            controller: ctrl,
            hasCounter: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings,
            suffixAction: controller.functionCalledDialog,
          )),
      _item(
        name: 'TextField with Data',
        widget: AppTextField(
          controller: ctrlWithData,
          hasCounter: true,
          hint: textFieldHint,
          suffixIcon: AppIcons.settings,
          suffixAction: controller.functionCalledDialog,
        ),
      ),
      _item(
          name: 'TextField Expandable',
          widget: AppTextField(
            controller: ctrlWithMultipleLinesData,
            hasCounter: true,
            maxLength: 100,
            showMaxLength: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings,
            suffixAction: controller.functionCalledDialog,
          )),
      _item(
          name: 'TextField Whole Widget Function',
          widget: AppTextField(
            controller: ctrl,
            label: textFieldLabel,
            hint: textFieldHint,
            wholeWidgetAction: controller.functionCalledDialog,
          )),
      _item(
          name: 'TextField with Error',
          widget: AppTextField(
            controller: ctrlWithData,
            label: textFieldLabel,
            hint: textFieldHint,
            errorText: 'Error',
          )),
    ], title: 'TextFields');
  }

  _generalButtons() => _section([
        _item(
            name: 'AppGeneralButton',
            widget: AppGeneralButton(
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        _item(
            primary: true,
            name: 'AppGeneralButton PrimaryColor',
            widget: AppGeneralButton(
              primaryColor: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        _item(
            name: 'AppGeneralButton Loading',
            widget: AppGeneralButton(
              loading: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        _item(
            primary: true,
            name: 'AppGeneralButton Primary Loading',
            widget: AppGeneralButton(
              loading: true,
              primaryColor: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        _item(
            name: 'AppGeneralButton Disabled',
            widget: AppGeneralButton(
              disabled: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
      ], title: 'General Buttons');

  _checkBoxes() => _section([
        _item(name: 'AppCheckBox\nChecked', widget: AppCheckBox(value: true, onChanged: (value) => null)),
        _item(name: 'AppCheckBox\nNot Checked', widget: AppCheckBox(value: false, onChanged: (value) => null)),
      ], isRow: true, title: 'CheckBoxes');

  _switches() => _section([
        _item(name: 'Switch Off', widget: AppSwitch(value: false, onChanged: (value) => null)),
        _item(name: 'Switch ON', widget: AppSwitch(value: true, onChanged: (value) => null)),
      ], isRow: true, title: 'Switches');

  _progressIndicators() => _section([
        _item(name: 'AppProgressIndicator Circular', widget: AppProgressIndicator.circular()),
        _item(name: 'AppProgressIndicator Linear', widget: AppProgressIndicator.linear()),
      ], title: 'Progress Indicators');

  _alertDialogs() => _section([
        _item(
            widget: AppGeneralButton(
          text: 'Alert Dialog with OK',
          onTap: () => AppAlertDialogs().withOk(title: 'Alert Dialog Title', text: 'App Alert Dialog with Yes/No', onTapOk: popPage),
        )),
        _item(
            widget: AppGeneralButton(
          text: 'Alert Dialog with Ok/Cancel',
          onTap: () => AppAlertDialogs().withOkCancel(title: 'Alert Dialog Title', text: 'App Alert Dialog with Ok/Cancel', onTapOk: popPage),
        )),
        _item(
            widget: AppGeneralButton(
          text: 'Alert Dialog by Widget with OK',
          onTap: () => AppAlertWidgetDialogs().withOk(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
        _item(
            widget: AppGeneralButton(
          text: 'Alert Dialog by Widget with Ok/Cancel',
          onTap: () => AppAlertWidgetDialogs().withOkCancel(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
      ], title: 'Alert Dialogs');

  _alertDialogWidget() => Column(mainAxisSize: MainAxisSize.min, children: List<Widget>.generate(5, (index) => const Text('Some Widget').withTertiaryColor));

  _bottomSheetDialog() {
    Widget form = Column(
        children: List<Widget>.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('App BottomSheet Dialog without Button').withTertiaryColor,
                )));

    return _section([
      _item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog without Button',
        onTap: () => AppBottomDialogs().withoutButton(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      _item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with OK',
        onTap: () => AppBottomDialogs().withOk(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
      _item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with Cancel',
        onTap: () => AppBottomDialogs().withCancel(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      _item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with OK/Cancel',
        onTap: () => AppBottomDialogs().withOkCancel(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
    ], title: 'BottomSheet Dialogs');
  }

  _snackBars() => _section([
        _item(
            widget: AppGeneralButton(
                text: 'Snackbar',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                    ))),
        _item(
            widget: AppGeneralButton(
                text: 'Snackbar with LeadingText',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                      leadingText: 'Leading Text',
                      leadingAction: controller.functionCalledDialog,
                    ))),
        _item(
            widget: AppGeneralButton(
                text: 'Snackbar with LeadingIcon',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with LeadingIcon',
                      title: 'AppSnackBar Title',
                      leadingIcon: AppIcons.info,
                      leadingAction: controller.functionCalledDialog,
                    ))),
        _item(
            widget: AppGeneralButton(
                text: 'Snackbar with Button',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                      buttonText: 'Button',
                      buttonAction: controller.functionCalledDialog,
                    ))),
      ], title: 'SnackBars');

  _appBar() => _section([
        _item(
            fullWidth: true,
            widget: AppAppBar(
              pageDetail: const AppPageDetail(pageRoute: AppRoutes.adminWidgetCheckPage, pageName: 'Page Name'),
              barLeading: AppIconButton(icon: AppIcons.list, onTap: nullFunction),
              barAction: AppIconButton(icon: AppIcons.add, onTap: nullFunction),
            )),
      ], title: 'AppBar');

  _bottomNavigationBar() => _section([
        _item(
          fullWidth: true,
          widget: const AppBottomNavigationBar(selectedIndex: 0),
        )
      ], title: 'Bottom Navigation Bar');

  _icons() => _section([
        _item(
            widget: Scrollbar(
              trackVisibility: true,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                      children: List<Widget>.generate(
                          AppIcons.iconsList.length,
                          (index) => Padding(
                            padding: AppPaddings.pages,
                            child: AppIcons.iconsList[index].withSecondaryColor,
                          )))),
            ), fullWidth: true)
      ], title: 'Icons');

  _section(List<Widget> section, {bool? isRow, String? title}) => Column(children: [
        title == null
            ? shrinkSizedBox
            : Column(children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                AppDividers.settings,
              ]),
        isRow == true ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: List<Widget>.generate(section.length, (index) => Expanded(child: section[index]))) : Column(children: section),
        AppDividers.general,
      ]);

  _item({String? name, Widget? widget, bool? primary, bool? fullWidth}) => Column(children: [
        Padding(
          padding: fullWidth == true ? AppPaddings.zero : AppPaddings.buttonXLarge,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            name == null ? shrinkSizedBox : Text(name, textAlign: TextAlign.center),
            name == null ? shrinkSizedBox : AppSpaces.h20,
            Container(
              padding: fullWidth == true ? AppPaddings.zero : const EdgeInsets.symmetric(horizontal: 20),
              // color: primary == true ? AppColors.appSecondary : null,
              child: widget ?? shrinkSizedBox,
            ),
          ]),
        ),
      ]);
}
