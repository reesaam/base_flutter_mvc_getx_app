import 'package:flutter/material.dart';

import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_date_time.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_int.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_locale.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_string.dart';
import '../../../core/app_localization.dart';
import '../../../core/app_localization_texts.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/resources/app_countries.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../controller/admin_data_format_check_controller.dart';

class AdminDataFormatCheckPage extends CoreView<AdminDataFormatCheckController> {
  const AdminDataFormatCheckPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.general(),
        _locale(),
        _dateTime(),
        _currency(),
      ]);

  _locale() => _section([
        _item(name: 'Language', string: AppLocalization.to.getLocale().getLanguageName),
      ], title: 'Localization');

  _dateTime() => _section([
        _item(name: 'Date & Time', string: DateTime.now().toDateTimeFormat()),
        _item(name: 'Date', string: DateTime.now().toDateFormat()),
        _item(name: 'Time', string: DateTime.now().toTimeFormat()),
        _item(name: 'Time with Seconds', string: DateTime.now().toTimeFormatWithSeconds()),
      ], title: 'Date & Time');

  _currency() => _section([
        _item(name: 'Separators', string: 22500000.toCurrency()),
        _item(name: 'Separators with Sign', string: 55400000.toCurrency(sign: AppCountry.us.currency?.sign.string ?? '')),
        _item(name: 'Separators', string: 22500000.toCurrency()),
        _item(name: 'Separators with Sign', string: 55400000.toCurrency(sign: AppLocalization.to.getCountry().currency?.sign.string ?? AppCountry.us.currency?.sign.string ?? '')),
      ], title: 'Currency');

  _section(List<Widget> section, {bool? isRow, String? title}) => Column(children: [
        title == null
            ? shrinkSizedBox
            : Column(children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                AppDividers.settings,
              ]),
        isRow == true ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: List<Widget>.generate(section.length, (index) => Expanded(child: section[index]))) : Column(children: section),
        AppDividers.generalWithDisabledColor,
      ]);

  _item({String? name, String? string, bool? fullWidth}) => Column(children: [
        Padding(
            padding: fullWidth == true ? AppPaddings.zero : AppPaddings.buttonXLarge,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              name == null ? shrinkSizedBox : Text(name, textAlign: TextAlign.center),
              name == null ? shrinkSizedBox : AppSpaces.h20,
              Container(
                padding: fullWidth == true ? AppPaddings.zero : const EdgeInsets.symmetric(horizontal: 20),
                child: Text(string ?? '-'),
              ),
            ])),
      ]);
}
