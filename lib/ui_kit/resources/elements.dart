import 'package:flutter/material.dart';

import '../../core/core_resources/defaults.dart';
import '../theme/app_themes_variables.dart';

class AppElements {
  ///Radius
  static double get radiusZero => 0;
  static double get radiusLow => 10;
  static double get radiusNormal => 20;
  static double get radiusHigh => 30;
  static double get defaultRadius => radiusLow;

  ///BorderRadius
  static Radius get circularRadiusDefault => Radius.circular(defaultRadius);
  static Radius get circularRadiusZero => Radius.circular(radiusZero);
  static Radius get circularRadiusLow => Radius.circular(radiusLow);
  static Radius get circularRadiusNormal => Radius.circular(radiusNormal);
  static Radius get circularRadiusHigh => Radius.circular(radiusHigh);

  ///Border
  static BorderRadius get borderRadiusDefault => BorderRadius.all(circularRadiusDefault);
  static BorderRadius get borderRadiusZero => BorderRadius.all(circularRadiusZero);
  static BorderRadius get borderRadiusLow => BorderRadius.all(circularRadiusLow);
  static BorderRadius get borderRadiusNormal => BorderRadius.all(circularRadiusNormal);
  static BorderRadius get borderRadiusHigh => BorderRadius.all(circularRadiusHigh);

  static BorderRadius get borderRadiusTop => BorderRadius.only(topLeft: circularRadiusDefault, topRight: circularRadiusDefault);

  ///BorderSide
  static BorderSide get _borderSideGeneral => BorderSide(color: AppThemesVariables.appSecondary, width: appDefaultBorderWidth);
  static BorderSide get borderSideLight => _borderSideGeneral.copyWith(color: AppThemesVariables.appPrimary);
  static BorderSide get borderSideDark => _borderSideGeneral.copyWith(color: AppThemesVariables.appSecondaryDark);
  static BorderSide get borderSidePrimary => _borderSideGeneral.copyWith(color: AppThemesVariables.appPrimary);
  static BorderSide get borderSideSecondary => _borderSideGeneral.copyWith(color: AppThemesVariables.appSecondary);
  static BorderSide get borderSideTertiary => _borderSideGeneral.copyWith(color: AppThemesVariables.appTertiary);
  static BorderSide get borderSideErrorLight => _borderSideGeneral.copyWith(color: AppThemesVariables.appError);
  static BorderSide get borderSideErrorDark => _borderSideGeneral.copyWith(color: AppThemesVariables.appErrorDark);
  static BorderSide get borderSideTransparent => _borderSideGeneral.copyWith(color: AppThemesVariables.transparent);
  static BorderSide get borderSideFocusedLight => _borderSideGeneral.copyWith(color: AppThemesVariables.appSecondary);
  static BorderSide get borderSideFocusedDark => _borderSideGeneral.copyWith(color: AppThemesVariables.appSecondary);
  static BorderSide get borderSideDisabled => _borderSideGeneral.copyWith(color: AppThemesVariables.appDisabled);
  static BorderSide get borderSideDisabledDark => _borderSideGeneral.copyWith(color: AppThemesVariables.appDisabledDark);

  ///OutlineInputBorder
  static OutlineInputBorder get _borderOutlinedGeneral => OutlineInputBorder(borderRadius: borderRadiusLow);
  static OutlineInputBorder get borderOutlinedLight => _borderOutlinedGeneral.copyWith(borderSide: borderSideLight);
  static OutlineInputBorder get borderOutlinedDark => _borderOutlinedGeneral.copyWith(borderSide: borderSideDark);
  static OutlineInputBorder get borderOutlinedFocusedLight => _borderOutlinedGeneral.copyWith(borderSide: borderSideFocusedLight);
  static OutlineInputBorder get borderOutlinedFocusedDark => _borderOutlinedGeneral.copyWith(borderSide: borderSideFocusedDark);
  static OutlineInputBorder get borderOutlinedDisabledLight => _borderOutlinedGeneral.copyWith(borderSide: borderSideDisabled);
  static OutlineInputBorder get borderOutlinedDisabledDark => _borderOutlinedGeneral.copyWith(borderSide: borderSideDisabledDark);
  static OutlineInputBorder get borderOutlinedErrorLight => _borderOutlinedGeneral.copyWith(borderSide: borderSideErrorLight);
  static OutlineInputBorder get borderOutlinedErrorDark => _borderOutlinedGeneral.copyWith(borderSide: borderSideErrorDark);
  static OutlineInputBorder get borderOutlinedTransparent => _borderOutlinedGeneral.copyWith(borderSide: borderSideTransparent);
  static OutlineInputBorder get borderOutlinedTransparentZeroRadius => borderOutlinedTransparent.copyWith(borderRadius: borderRadiusZero);

  ///BoxBorder
  static BoxBorder get boxBorderLight => Border.all(color: AppThemesVariables.appBackground);
  static BoxBorder get boxBorderDark => Border.all(color: AppThemesVariables.appBackgroundDark);
  static BoxBorder get boxBorderTransparent => Border.all(color: AppThemesVariables.transparent);

  ///Shapes
  static BoxDecoration get boxDecorationDefault => BoxDecoration(borderRadius: AppElements.borderRadiusDefault);
  static BoxDecoration get listPageSearchBox => BoxDecoration(border: Border.all(color: AppThemesVariables.transparent));

  ///RoundedRectangleBorder
  static RoundedRectangleBorder get borderShapeDefault => borderShapeLowRadius;
  static RoundedRectangleBorder get borderShapeLowRadius => RoundedRectangleBorder(borderRadius: borderRadiusLow);
  static RoundedRectangleBorder get borderShapeNormalRadius => RoundedRectangleBorder(borderRadius: borderRadiusLow, side: borderSidePrimary);
  static RoundedRectangleBorder get borderShapeHighRadius => RoundedRectangleBorder(borderRadius: borderRadiusLow);
  static RoundedRectangleBorder get borderShapeModal => RoundedRectangleBorder(borderRadius: borderRadiusTop);
  static RoundedRectangleBorder get borderShapeAlertDialog => RoundedRectangleBorder(borderRadius: borderRadiusDefault);

  ///Avatars
  static double get contactsListAvatarMaxRadius => 18;
  static double get contactsContactAvatarMaxRadius => 30;

  ///Panel
  // static BoxBorder get defaultPanelBorder => Border.all(color: AppThemesVariables.panelBorder);
  // static BoxDecoration get defaultPanel => BoxDecoration(border: defaultPanelBorder, borderRadius: defaultBorderWithRadius);
}
