import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_extensions/extension_on_countries.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_string.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/resources/app_countries.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../controller/admin_app_countries_controller.dart';

class AdminAppCountriesPage extends CoreView<AdminAppCountriesController> {
  const AdminAppCountriesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [AppDividers.general(), Column(children: List<Widget>.generate(controller.countries.length, (index) => _section(controller.countries[index])))]);

  _section(AppCountries country, {String? title}) => Column(children: [
        Padding(
            padding: AppPaddings.buttonXLarge,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  flex: 5,
                  child: Column(children: [
                    _item('Name Abbr', country.countryNameAbbreviation),
                    _item('TimeZone Abbr', country.timeZoneAbbreviation?.first),
                    _item('TimeZone Offset', country.timeZoneOffset?.first.hour.toString()),
                    _item('Code', country.code),
                    _item('Currency', country.currency),
                    _item('Currency Sign', country.currencySign?.sign),
                  ])),
              shrinkExpanded(2),
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    country.flag,
                    AppSpaces.h20,
                    Text(country.countryName ?? ''),
                  ])),
            ])),
        AppDividers.generalWithDisabledColor,
      ]);

  _item(String? title, String? text) => text == null
      ? shrinkSizedBox
      : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title?.withDoubleDots ?? ''),
          Text(text),
        ]);
}
