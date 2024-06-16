import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) => Checkbox(
      fillColor: MaterialStateProperty.all(AppColors.appCheckBoxTick),
      side: AppElements.defaultBorderSideCheckBox,
      checkColor: AppColors.appCheckBox,
      value: value,
      onChanged: (isChecked) => onChanged(isChecked));
}
