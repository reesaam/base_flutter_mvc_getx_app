import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../info/app_defaults.dart';
import '../../storage/app_local_storage.dart';
import '../app_elements.dart';
import 'app_theme_data_model.dart';
import 'app_themes_variables.dart';

class AppThemes {
  ///Main Theme Functions
  static ThemeData get to => Get.find<AppThemes>().getTheme();

  static ThemeData get lightTheme => Get.find<AppThemes>().getTheme(isSystemDark: false);
  static ThemeData get darkTheme => Get.find<AppThemes>().getTheme(isSystemDark: true);

  ThemeData importTheme({ThemeData? themeData}) => themeData ?? getTheme();

  bool isDark = false;

  ///Get Variables and Decide about Theme
  ThemeData getTheme({bool? isSystemDark}) {
    bool? storageResult = AppLocalStorage.to.loadSettings().fold((l) => null, (r) => r.darkMode);
    bool isDark = storageResult == true || isSystemDark == true;
    return _theme();
  }

  ///Theme Constructor
  ThemeData _theme() => ThemeData(
        colorScheme: _colorScheme(),
        canvasColor: _canvasColor(),
        primaryColor: _primaryColor(),
        primaryColorLight: AppThemesVariables.appPrimary,
        primaryColorDark: AppThemesVariables.appPrimaryDark,
        primaryTextTheme: _textTheme(),
        fontFamily: AppThemesVariables.appFont,
        appBarTheme: _appBar(),
        bottomAppBarTheme: _bottomAppBar(),
        drawerTheme: _drawer(),
        bottomNavigationBarTheme: _bottomNavigationBar(),
        navigationBarTheme: _navigationBar(),
        navigationDrawerTheme: _navigationDrawer(),
        navigationRailTheme: _navigationRail(),
        snackBarTheme: _snackBar(),
        dialogTheme: _dialog(),
        bottomSheetTheme: _bottomSheet(),
        floatingActionButtonTheme: _floatingActionButton(),
        bannerTheme: _banner(),
        badgeTheme: _badge(),
        chipTheme: _chip(),
        indicatorColor: _progressIndicator().color,
        progressIndicatorTheme: _progressIndicator(),
        iconTheme: _icon(),
        actionIconTheme: _actionIcon(),
        textTheme: _textTheme(),
        buttonTheme: _button(),
        elevatedButtonTheme: _buttonElevated(),
        outlinedButtonTheme: _buttonOutlined(),
        filledButtonTheme: _buttonFilled(),
        textButtonTheme: _buttonText(),
        iconButtonTheme: _buttonIcon(),
        buttonBarTheme: _buttonBar(),
        toggleButtonsTheme: _buttonToggle(),
        menuButtonTheme: _buttonMenu(),
        dropdownMenuTheme: _buttonDropDown(),
        cardTheme: _card(),
        cardColor: _card().color,
        checkboxTheme: _checkBox(),
        switchTheme: _switch(),
        dividerTheme: _divider(),
        // tooltipTheme: ,
        // adaptations:
      );

  ///Colors
  Color _canvasColor() => AppThemeDataModel<Color>(
        lightThemeData: AppThemesVariables.appBackground,
        darkThemeData: AppThemesVariables.appBackgroundDark,
      ).getMode<Color>(isDark);

  Color _primaryColor() => AppThemeDataModel<Color>(
        lightThemeData: AppThemesVariables.appPrimary,
        darkThemeData: AppThemesVariables.appPrimaryDark,
      ).getMode<Color>(isDark);

  ColorScheme _colorScheme() => AppThemeDataModel<ColorScheme>(
        lightThemeData: AppThemesVariables.colorSchemeLight,
        darkThemeData: AppThemesVariables.colorSchemeDark,
      ).getMode<ColorScheme>(isDark);

  _colorSchemeSeed() => AppThemeDataModel<Color>(
        lightThemeData: AppThemesVariables.colorSchemeSeedLight,
        darkThemeData: AppThemesVariables.colorSchemeSeedDark,
      ).getMode<Color>(isDark);

  ///Main Components
  AppBarTheme _appBar() {
    AppBarTheme generalTheme = AppBarTheme(
      centerTitle: true,
    );
    return AppThemeDataModel<AppBarTheme>(
        lightThemeData: generalTheme.copyWith(
          backgroundColor: AppThemesVariables.appBackground,
          foregroundColor: AppThemesVariables.appSecondary,
        ),
        darkThemeData: generalTheme.copyWith(
          backgroundColor: AppThemesVariables.appBackgroundDark,
          foregroundColor: AppThemesVariables.appSecondaryDark,
        )).getMode<AppBarTheme>(isDark);
  }

  BottomAppBarTheme _bottomAppBar() {
    BottomAppBarTheme generalTheme = BottomAppBarTheme(
      elevation: 5,
    );
    return AppThemeDataModel<BottomAppBarTheme>(
      lightThemeData: generalTheme.copyWith(color: AppThemesVariables.appPrimary),
      darkThemeData: generalTheme.copyWith(color: AppThemesVariables.appPrimaryDark),
    ).getMode<BottomAppBarTheme>(isDark);
  }

  DrawerThemeData _drawer() {
    DrawerThemeData generalTheme = DrawerThemeData(
      elevation: 5,
    );
    return AppThemeDataModel<DrawerThemeData>(
      lightThemeData: generalTheme.copyWith(backgroundColor: AppThemesVariables.appBackground),
      darkThemeData: generalTheme.copyWith(backgroundColor: AppThemesVariables.appBackgroundDark),
    ).getMode<DrawerThemeData>(isDark);
  }

  BottomNavigationBarThemeData _bottomNavigationBar() {
    IconThemeData defaultIconThemeData = IconThemeData();

    BottomNavigationBarThemeData themeData = BottomNavigationBarThemeData(
      backgroundColor: AppThemesVariables.appError,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      selectedIconTheme: defaultIconThemeData,
      unselectedIconTheme: defaultIconThemeData,
    );
    return AppThemeDataModel<BottomNavigationBarThemeData>(
        lightThemeData: themeData.copyWith(
          backgroundColor: AppThemesVariables.appPrimary,
          selectedItemColor: AppThemesVariables.appBackground,
          unselectedItemColor: AppThemesVariables.appTertiary,
        ),
        darkThemeData: themeData.copyWith(
          backgroundColor: AppThemesVariables.appPrimaryDark,
          selectedItemColor: AppThemesVariables.appBackgroundDark,
          unselectedItemColor: AppThemesVariables.appTertiaryDark,
        )).getMode<BottomNavigationBarThemeData>(isDark);
  }

  NavigationBarThemeData _navigationBar() {
    NavigationBarThemeData generalTheme = NavigationBarThemeData();
    return AppThemeDataModel<NavigationBarThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<NavigationBarThemeData>(isDark);
  }

  NavigationDrawerThemeData _navigationDrawer() {
    NavigationDrawerThemeData generalTheme = NavigationDrawerThemeData();
    return AppThemeDataModel<NavigationDrawerThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<NavigationDrawerThemeData>(isDark);
  }

  NavigationRailThemeData _navigationRail() {
    NavigationRailThemeData generalTheme = NavigationRailThemeData();
    return AppThemeDataModel<NavigationRailThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<NavigationRailThemeData>(isDark);
  }

  SnackBarThemeData _snackBar() {
    SnackBarThemeData generalTheme = SnackBarThemeData();

    return AppThemeDataModel<SnackBarThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<SnackBarThemeData>(isDark);
  }

  DialogTheme _dialog() {
    DialogTheme generalTheme = DialogTheme();

    return AppThemeDataModel<DialogTheme>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<DialogTheme>(isDark);
  }

  BottomSheetThemeData _bottomSheet() {
    BottomSheetThemeData generalTheme = BottomSheetThemeData();

    return AppThemeDataModel<BottomSheetThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<BottomSheetThemeData>(isDark);
  }

  FloatingActionButtonThemeData _floatingActionButton() {
    FloatingActionButtonThemeData generalTheme = FloatingActionButtonThemeData();

    return AppThemeDataModel<FloatingActionButtonThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<FloatingActionButtonThemeData>(isDark);
  }

  MaterialBannerThemeData _banner() => AppThemeDataModel<MaterialBannerThemeData>(
        lightThemeData: MaterialBannerThemeData(),
        darkThemeData: MaterialBannerThemeData(),
      ).getMode<MaterialBannerThemeData>(isDark);

  BadgeThemeData _badge() => AppThemeDataModel<BadgeThemeData>(
        lightThemeData: BadgeThemeData(),
        darkThemeData: BadgeThemeData(),
      ).getMode<BadgeThemeData>(isDark);

  ChipThemeData _chip() => AppThemeDataModel<ChipThemeData>(
        lightThemeData: ChipThemeData(),
        darkThemeData: ChipThemeData(),
      ).getMode<ChipThemeData>(isDark);

  ProgressIndicatorThemeData _progressIndicator() => AppThemeDataModel<ProgressIndicatorThemeData>(
        lightThemeData: ProgressIndicatorThemeData(),
        darkThemeData: ProgressIndicatorThemeData(),
      ).getMode<ProgressIndicatorThemeData>(isDark);

  IconThemeData _icon() => AppThemeDataModel<IconThemeData>(
        lightThemeData: IconThemeData(),
        darkThemeData: IconThemeData(),
      ).getMode<IconThemeData>(isDark);

  ActionIconThemeData _actionIcon() => AppThemeDataModel<ActionIconThemeData>(
        lightThemeData: ActionIconThemeData(),
        darkThemeData: ActionIconThemeData(),
      ).getMode<ActionIconThemeData>(isDark);

  ///Text
  TextStyle _textStyle() => TextStyle(
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  TextTheme _textTheme() {
    TextStyle generalStyle = _textStyle();

    TextStyle lightStyle = generalStyle.copyWith(
      color: AppThemesVariables.appPrimary,
    );
    TextStyle darkStyle = generalStyle.copyWith(
      color: AppThemesVariables.appPrimaryDark,
    );

    TextTheme themeLight = TextTheme(
      bodyLarge: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeLarge),
      bodyMedium: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      bodySmall: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeSmall),
      displayLarge: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displayMedium: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displaySmall: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeSmall),
      titleLarge: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeTitleLarge),
      titleMedium: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeTitle),
      titleSmall: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeTitle),
    );

    TextTheme themeDark = TextTheme(
      bodyLarge: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeLarge),
      bodyMedium: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      bodySmall: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeSmall),
      displayLarge: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displayMedium: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displaySmall: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeSmall),
      titleLarge: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeTitleLarge),
      titleMedium: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeTitle),
      titleSmall: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeTitle),
    );

    return AppThemeDataModel<TextTheme>(
      lightThemeData: themeLight,
      darkThemeData: themeDark,
    ).getMode<TextTheme>(isDark);
  }

  ///Buttons
  ButtonThemeData _button() {
    ButtonThemeData generalTheme = ButtonThemeData();
    return AppThemeDataModel<ButtonThemeData>(
        lightThemeData: generalTheme.copyWith(
          buttonColor: AppThemesVariables.appPrimary,
          disabledColor: AppThemesVariables.appDisabled,
        ),
        darkThemeData: generalTheme.copyWith(
          buttonColor: AppThemesVariables.appPrimaryDark,
          disabledColor: AppThemesVariables.appDisabledDark,
        )).getMode<ButtonThemeData>(isDark);
  }

  TextStyle _buttonTextStyle() => TextStyle(
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  ButtonStyle _buttonStyle() => ButtonStyle(
        shape: MaterialStateProperty.all(AppElements.borderShapeDefault),
        textStyle: MaterialStateProperty.all(_buttonTextStyle()),
      );

  ElevatedButtonThemeData _buttonElevated() {
    ButtonStyle buttonStyleLight = _buttonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(AppThemesVariables.appPrimary),
      foregroundColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
    );

    ButtonStyle buttonStyleDark = _buttonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(AppThemesVariables.appPrimaryDark),
      foregroundColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
    );

    return AppThemeDataModel<ElevatedButtonThemeData>(
      lightThemeData: ElevatedButtonThemeData(style: buttonStyleLight),
      darkThemeData: ElevatedButtonThemeData(style: buttonStyleDark),
    ).getMode<ElevatedButtonThemeData>(isDark);
  }

  OutlinedButtonThemeData _buttonOutlined() => AppThemeDataModel<OutlinedButtonThemeData>(
        lightThemeData: OutlinedButtonThemeData(style: _buttonStyle()),
        darkThemeData: OutlinedButtonThemeData(style: _buttonStyle()),
      ).getMode<OutlinedButtonThemeData>(isDark);

  FilledButtonThemeData _buttonFilled() => AppThemeDataModel<FilledButtonThemeData>(
        lightThemeData: FilledButtonThemeData(style: _buttonStyle()),
        darkThemeData: FilledButtonThemeData(style: _buttonStyle()),
      ).getMode<FilledButtonThemeData>(isDark);

  TextButtonThemeData _buttonText() => AppThemeDataModel<TextButtonThemeData>(
        lightThemeData: TextButtonThemeData(style: _buttonStyle()),
        darkThemeData: TextButtonThemeData(style: _buttonStyle()),
      ).getMode<TextButtonThemeData>(isDark);

  IconButtonThemeData _buttonIcon() => AppThemeDataModel<IconButtonThemeData>(
        lightThemeData: IconButtonThemeData(style: _buttonStyle()),
        darkThemeData: IconButtonThemeData(style: _buttonStyle()),
      ).getMode<IconButtonThemeData>(isDark);

  ButtonBarThemeData _buttonBar() => AppThemeDataModel<ButtonBarThemeData>(
        lightThemeData: ButtonBarThemeData(),
        darkThemeData: ButtonBarThemeData(),
      ).getMode<ButtonBarThemeData>(isDark);

  ToggleButtonsThemeData _buttonToggle() => AppThemeDataModel<ToggleButtonsThemeData>(
        lightThemeData: ToggleButtonsThemeData(),
        darkThemeData: ToggleButtonsThemeData(),
      ).getMode<ToggleButtonsThemeData>(isDark);

  MenuButtonThemeData _buttonMenu() => AppThemeDataModel<MenuButtonThemeData>(
        lightThemeData: MenuButtonThemeData(style: _buttonStyle()),
        darkThemeData: MenuButtonThemeData(style: _buttonStyle()),
      ).getMode<MenuButtonThemeData>(isDark);

  ///Menus
  DropdownMenuThemeData _buttonDropDown() => AppThemeDataModel<DropdownMenuThemeData>(
        lightThemeData: DropdownMenuThemeData(),
        darkThemeData: DropdownMenuThemeData(),
      ).getMode<DropdownMenuThemeData>(isDark);

  ///Others
  CardTheme _card() {
    CardTheme theme = CardTheme(shape: AppElements.borderShapeDefault);
    return AppThemeDataModel<CardTheme>(
        lightThemeData: theme.copyWith(
          color: AppThemesVariables.appBackground,
        ),
        darkThemeData: CardTheme(
          color: AppThemesVariables.appBackgroundDark,
        )).getMode<CardTheme>(isDark);
  }

  CheckboxThemeData _checkBox() {
    CheckboxThemeData themeData = CheckboxThemeData();
    return AppThemeDataModel<CheckboxThemeData>(
        lightThemeData: themeData.copyWith(
          checkColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
          fillColor: MaterialStateProperty.all(AppThemesVariables.appPrimary),
          side: AppElements.borderSideLight,
        ),
        darkThemeData: themeData.copyWith(
          checkColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
          fillColor: MaterialStateProperty.all(AppThemesVariables.appPrimaryDark),
        )).getMode<CheckboxThemeData>(isDark);
  }

  SwitchThemeData _switch() {
    SwitchThemeData themeData = SwitchThemeData();
    return AppThemeDataModel<SwitchThemeData>(
        lightThemeData: themeData.copyWith(
          overlayColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
          trackOutlineColor: MaterialStateProperty.all(AppThemesVariables.appPrimary),
          thumbColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
        ),
        darkThemeData: themeData.copyWith(
          overlayColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
          trackOutlineColor: MaterialStateProperty.all(AppThemesVariables.appPrimaryDark),
          thumbColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
        )).getMode<SwitchThemeData>(isDark);
  }

  DividerThemeData _divider() {
    DividerThemeData themeData = DividerThemeData();
    return AppThemeDataModel<DividerThemeData>(
        lightThemeData: themeData.copyWith(
          color: AppThemesVariables.appSecondary,
        ),
        darkThemeData: themeData.copyWith(
          color: AppThemesVariables.appSecondaryDark,
        )).getMode<DividerThemeData>(isDark);
  }
}