
import 'dart:io';

import 'package:contact_info/screen/providers/provider.dart';
import 'package:contact_info/screen/providers/screen_provider.dart';
import 'package:contact_info/screen/providers/ui_provider.dart';
import 'package:contact_info/theme/theme.dart';
import 'package:contact_info/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Provider1()),
        ChangeNotifierProvider.value(value: UiProvider()),
        ChangeNotifierProvider.value(value: ScreenProvider())
      ],
      child: Consumer2<Provider1,UiProvider>(
        builder:  (context, value, value2, child) {
          value2.getUi();
          value2.iosUi=value2.pAppUi;
          value.getTheme();
          value.theme=value.pTheme;
          return
          value2.pAppUi==false?
          MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            themeMode: value.mode,
            routes: myRouts
          ):
              CupertinoApp(
                debugShowCheckedModeBanner: false,
                routes: myRoutsIos,
              );
        },
      ),
    ),
  );
}