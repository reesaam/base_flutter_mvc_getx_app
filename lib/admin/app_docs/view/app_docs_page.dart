import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/resources/app_paddings.dart';
import '../controller/app_docs_controller.dart';

class AppDocsPage extends CoreView<AppDocsController> {
  const AppDocsPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.general,
        _docs(),
      ]);

  _docs() => _section([
        _item(text: 'Docs Generate', function: () {}),
      ], title: 'Main Docs');

  _section(List<Widget> section, {String? title}) => Column(children: [
        title == null
            ? shrinkSizedBox
            : Column(children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                AppDividers.settings,
              ]),
        Column(children: section),
        AppDividers.general,
      ]);

  _item({required String text, required Function function}) => AppGeneralButton(text: text, onTap: () => function());
}
