import 'package:asroo_store_app/core/style/colors/colors_dark.dart';
import 'package:asroo_store_app/core/style/colors/colors_light.dart';
import 'package:asroo_store_app/core/theme/assets_extension.dart';
import 'package:asroo_store_app/core/theme/color_extension.dart';
import 'package:flutter/material.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light, MyAssets.light],
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsLight.black,
      ),
    ),
  );
}
