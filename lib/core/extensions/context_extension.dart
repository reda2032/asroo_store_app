import 'package:asroo_store_app/core/theme/assets_extension.dart';
import 'package:asroo_store_app/core/theme/color_extension.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {

  //color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // images

  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;



  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();

  
}
