import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/general_widgets/app_dividers.dart';
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
        AppDividers.general(),
        _mainDocs(),
      ]);

  _mainDocs() => _section(items: [
        _item(text: 'Docs Generate', function: () {}),
      ], title: 'Main Docs', isGrid: true);

  _section({required List<Widget> items, required String title, bool? isGrid}) => Column(children: [
        Column(children: [Text(title, style: const TextStyle(fontSize: 20)), AppDividers.settings]),
        Padding(
            padding: AppPaddings.buttonXLarge,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: items.length > 1 && isGrid == true ? 4 : 8,
              crossAxisCount: items.length > 1 && isGrid == true ? 2 : 1,
              children: List<Widget>.generate(items.length, (index) => items[index]),
            )),
        AppDividers.general(),
      ]);

  _item({required String text, required Function function}) => AppGeneralButton(text: text, onTap: () => function());
}
