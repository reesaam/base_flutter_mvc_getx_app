import 'package:flutter/material.dart';

import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/resources/app_paddings.dart';
import '../../admin_general_functions.dart';
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

  _mainDocs() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Docs Generate', function: () {}),
      ], title: 'Main Docs');
}
