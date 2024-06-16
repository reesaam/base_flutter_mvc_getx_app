import 'package:flutter/material.dart';

import '../info/app_defaults.dart';
import 'app_colors.dart';

class AppElements {
  ///Radius
  static double get radiusZero => 0;
  static double get radiusLow => 10;
  static double get radiusNormal => 20;
  static double get radiusHigh => 30;
  static double get defaultRadius => radiusNormal;

  ///BorderRadius
  static Radius get defaultBorderRadius => Radius.circular(defaultRadius);
  static Radius get defaultBorderRadiusZero => Radius.circular(radiusZero);
  static Radius get defaultBorderRadiusLow => Radius.circular(radiusLow);
  static Radius get defaultBorderRadiusNormal => Radius.circular(radiusNormal);
  static Radius get defaultBorderRadiusHigh => Radius.circular(radiusHigh);

  ///Border
  static BorderRadius get defaultBorderWithNoRadius => BorderRadius.all(defaultBorderRadiusZero);
  static BorderRadius get defaultBorderWithRadius => BorderRadius.all(defaultBorderRadius);
  static BorderRadius get defaultBorderWithLowRadius => BorderRadius.all(defaultBorderRadiusLow);
  static BorderRadius get topBorderWithRadius => BorderRadius.only(topLeft: defaultBorderRadius, topRight: defaultBorderRadius);

  ///BorderSide
  static BorderSide get defaultBorderSide => BorderSide(color: AppColors.textNormalDark, width: appDefaultBorderWidth);
  static BorderSide get defaultBorderSideError => BorderSide(color: AppColors.error, width: appDefaultBorderWidth);
  static BorderSide get cardTransparentBorderSide => BorderSide(color: AppColors.transparent, width: appDefaultBorderWidth);
  static BorderSide get defaultBorderSideFocused => BorderSide(color: AppColors.appDefaultColor, width: appDefaultBorderWidth);
  static BorderSide get defaultBorderSideDisabled => BorderSide(color: AppColors.buttonBackgroundDisabled, width: appDefaultBorderWidth);
  static BorderSide get defaultBorderSideCheckBox => defaultBorderSide.copyWith(color: AppColors.appCheckBox);

  ///OutlineInputBorder
  static OutlineInputBorder get defaultOutlineBorder => OutlineInputBorder(borderRadius: defaultBorderWithLowRadius, borderSide: defaultBorderSide);
  static OutlineInputBorder get defaultOutlineBorderFocused => OutlineInputBorder(borderRadius: defaultBorderWithLowRadius, borderSide: defaultBorderSideFocused);
  static OutlineInputBorder get defaultOutlineBorderDisabled => OutlineInputBorder(borderRadius: defaultBorderWithLowRadius, borderSide: defaultBorderSideDisabled);
  static OutlineInputBorder get defaultOutlineBorderError => OutlineInputBorder(borderRadius: defaultBorderWithLowRadius, borderSide: defaultBorderSideError);
  static OutlineInputBorder get cardTransparentOutlineBorder => OutlineInputBorder(borderRadius: defaultBorderWithLowRadius, borderSide: cardTransparentBorderSide);
  static OutlineInputBorder get cardTransparentOutlineBorderZeroRadius => OutlineInputBorder(borderRadius: defaultBorderWithNoRadius, borderSide: cardTransparentBorderSide);

  ///BoxBorder
  static BoxBorder get boxBorderTransparent => Border.all(color: AppColors.transparent);
  static BoxBorder get boxBorder => Border.all(color: AppColors.cardBackground);

  ///Shapes
  static BoxDecoration get shapeBoxDecoration => BoxDecoration(borderRadius: AppElements.defaultBorderWithRadius);
  static BoxDecoration get listPageSearchBox => BoxDecoration(border: Border.all(color: AppColors.transparent));

  ///RoundedRectangleBorder
  static RoundedRectangleBorder get defaultBorderShape => defaultBorderNormalRadiusShape;
  static RoundedRectangleBorder get defaultBorderLowRadiusShape => RoundedRectangleBorder(borderRadius: defaultBorderWithLowRadius);
  static RoundedRectangleBorder get defaultBorderNormalRadiusShape => RoundedRectangleBorder(borderRadius: defaultBorderWithLowRadius);
  static RoundedRectangleBorder get defaultBorderHighRadiusShape => RoundedRectangleBorder(borderRadius: defaultBorderWithLowRadius);
  static RoundedRectangleBorder get defaultModalBorderShape => RoundedRectangleBorder(borderRadius: topBorderWithRadius);
  static RoundedRectangleBorder get defaultAlertBorderShape => RoundedRectangleBorder(borderRadius: defaultBorderWithRadius);

  ///Avatars
  static double get contactsListAvatarMaxRadius => 18;
  static double get contactsContactAvatarMaxRadius => 30;

  ///Panel
  // static BoxBorder get defaultPanelBorder => Border.all(color: AppColors.panelBorder);
  // static BoxDecoration get defaultPanel => BoxDecoration(border: defaultPanelBorder, borderRadius: defaultBorderWithRadius);
}
