import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:medical_reminder/view_model/login_model.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:medical_reminder/util/colors.dart';

class HomeApp extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(create: (_) => LoginModel()),
        ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
        ChangeNotifierProvider<NewEntryModel>(create: (_) => NewEntryModel()),
      ],
      child: MaterialApp(
        title: 'MedicalReminder',
        theme: ThemeData(
          primarySwatch: themeColor,
          fontFamily: 'Lato',
        ),
//        darkTheme: ThemeData.dark(),

        home: HomePage(),//AuthPage(),
        initialRoute: '/',
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}