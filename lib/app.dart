import 'package:flutter/material.dart';
import 'package:medical_reminder/page/auth_login_page.dart';
import 'package:medical_reminder/util/colors.dart';
import 'package:medical_reminder/view_model/drawer_model.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:medical_reminder/view_model/login_model.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
  import 'package:medical_reminder/view_model/profile_info_model.dart';
import 'package:provider/provider.dart';



class MedicalReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(create: (_) => LoginModel()),
        ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
        ChangeNotifierProvider<NewEntryModel>(create: (_) => NewEntryModel()),
        ChangeNotifierProvider<DrawerModel>(create: (_) => DrawerModel()),
        ChangeNotifierProvider<ProfileInfoModel>(create: (_) => ProfileInfoModel()),


      ],
      child: MaterialApp(
        title: 'MedicalReminder',
        theme: ThemeData(
          primarySwatch: themeColor,
          fontFamily: 'Lato',
        ),
//        darkTheme: ThemeData.dark(),

        home: AuthPage(),
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
