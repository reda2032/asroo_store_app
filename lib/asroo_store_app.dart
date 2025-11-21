
import 'package:asroo_store_app/core/app/connectivity_controller.dart';
import 'package:asroo_store_app/core/app/env.variables.dart';
import 'package:asroo_store_app/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,

        builder: (_, value, _) {
          if (value) {
            return ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
            //splitScreenMode: true,
              child: MaterialApp(
                title: 'Asroo Store',
                debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                ),
                builder: (context, widget) {
                  return GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Scaffold(
                      body: Builder(
                        builder: (context) {
                          ConnectivityController.instance.init();
                          return widget!;
                        },
                      ),
                    ),
                  );
                },

                home: const Scaffold(
                  body: Center(
                    child: Text('Asroo Store'),
                  ),
                ),
              ),
            );
          } else {
            return MaterialApp(
              title: 'No NetWork ',
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              home: const NoNetWorkScreen(),
            );
          }
        });

  }
}
