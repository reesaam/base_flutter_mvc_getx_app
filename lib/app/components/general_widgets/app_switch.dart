import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_sizes.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, required this.value, required this.onChanged, this.enabled});

  final bool? value;
  final Function? onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: AppSizes.switchHeight.height,
      child: Switch(
        value: value == true ? true : false,
        onChanged: (value) => onChanged!(value),
        focusNode: FocusNode(canRequestFocus: enabled == false ? false : true),
        activeColor: AppColors.switchActive,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ));
}
