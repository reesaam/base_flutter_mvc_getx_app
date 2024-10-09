import 'package:flutter/material.dart';

import '../../../core/app_localization.dart';
import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../resources/paddings.dart';

class AppAppBar extends AppBar {
  AppAppBar({super.key, required this.pageDetail, this.barLeading, this.barAction}) : super();

  final AppPageDetail pageDetail;
  final Widget? barLeading;
  final Widget? barAction;

  @override
  Widget? get title => Text(pageDetail.pageName ?? Texts.to.empty);

  @override
  Widget? get leading => barLeading;

  @override
  List<Widget>? get actions => [Padding(padding: AppPaddings.appBarActions, child: barAction)];

  @override
  bool? get centerTitle => true;
}
