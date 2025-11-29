import 'package:asroo_store_app/asroo_store_app.dart';
import 'package:asroo_store_app/core/app/env.variables.dart';
import 'package:asroo_store_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Initialized environment variables
  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const AsrooStoreApp());
  });
}

