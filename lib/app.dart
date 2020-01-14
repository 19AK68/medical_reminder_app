import 'package:flutter/material.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class MedicalReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel())
      ],
      child: MaterialApp(
        title: 'MedicalReminder',
//        theme: ThemeData.light(),
//        darkTheme: ThemeData.dark(),

        home: HomePage(),
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
