import 'package:flutter/material.dart';
import 'package:medical_reminder/home_app.dart';
import 'package:medical_reminder/page/auth_login_page.dart';
import 'package:medical_reminder/page/first_page.dart';
import 'package:medical_reminder/page/home_page.dart';
import 'package:medical_reminder/page/new_entry_page.dart';
import 'package:medical_reminder/services/auth_servise.dart' ;
import 'package:medical_reminder/util/colors.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:medical_reminder/view_model/login_model.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:medical_reminder/widget/provider_widget.dart';
import 'package:medical_reminder/multi_provider_controller.dart';
import 'package:provider/provider.dart';





class MedicalReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: AuthService(),
      child: MaterialApp(
        title: "TMedicalReminder",
        theme: ThemeData(
          primarySwatch: themeColor,
          fontFamily: 'Lato',

        ),
        darkTheme: ThemeData.dark(),

        home: HomeController(),
        routes: <String, WidgetBuilder>{
          // '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          // '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
          '/homePage': (BuildContext context) => HomePage(),
          '/newEntry': (BuildContext context) => NewEntryPage(),


        },
      ),
    );
  }

  }
//
//  @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<LoginModel>(create: (_) => LoginModel()),
//         ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
//         ChangeNotifierProvider<NewEntryModel>(create: (_) => NewEntryModel()),
//       ],
//       child: MaterialApp(
//         title: 'MedicalReminder',
//         theme: ThemeData(
//           primarySwatch: themeColor,
//           fontFamily: 'Lato',
//         ),
// //        darkTheme: ThemeData.dark(),
//
//         home: FirstPage(),//AuthPage(),
//         initialRoute: '/',
//         onUnknownRoute: (settings) => MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text(
//                 'No route defined for ${settings.name}',
//                 style: TextStyle(color: Colors.black87),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }


class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthProvider.of(context).auth  ;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if(signedIn){
            return MultiProvider(
              providers: [
              ChangeNotifierProvider<LoginModel>(create: (_) => LoginModel()),
             ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
              ChangeNotifierProvider<NewEntryModel>(create: (_) => NewEntryModel()),],

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

          }else {
            return  FirstPage();
          }
         //  return signedIn ?
         //
         // HomeApp() : FirstPage();
        }
        return CircularProgressIndicator();
      },
    );
  }
}



