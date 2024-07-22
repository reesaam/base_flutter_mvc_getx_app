import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_widgets.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_text_styles.dart';

class SettingsSectionItemWidget extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Function? wholeItemFunction;

  const SettingsSectionItemWidget({super.key, required this.text, this.leading, this.wholeItemFunction});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: wholeItemFunction == null ? null : () => wholeItemFunction!(),
      child: Padding(
          padding: AppPaddings.settingsItem,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text, style: AppTextStyles.settingsSectionItem),
            leading ?? shrinkSizedBox,
          ])));
}
