import 'package:flutter/material.dart';
import 'package:medical_reminder/page/auth_login_page.dart';
import 'package:medical_reminder/page/profile_info_page.dart';
import 'package:medical_reminder/page/setting_page.dart';
import 'package:medical_reminder/util/enums/type_animation.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/drawer_model.dart';
import 'package:medical_reminder/widget/custom_app_bar_build.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar.build(
              context: context,
              title: "Profile",
              iconPath: Icon(Icons.clear, color: primaryColor)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor)),
                  child: Icon(
                    Icons.perm_identity,
                    size: 50,
                    color: primaryColor,
                  ))
            ],
          ),
          Container(
            height: 250,
            //  color: Colors.red[200],

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: UI.marginStandardDouble),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerItem(
                    text: 'Profile Info',
                    onPressed: () {
                      UI.navigate(
                        context,
                        ProfileIntoPage(),
                        this,
                        animationType: PageAnimationType.SLIDE_LEFT,);

                    },
                  ),
                  DrawerItem(
                    text: 'Setting',
                    onPressed: () {
                      UI.navigate(
                        context,
                        SettingPage(),
                        this,
                        animationType: PageAnimationType.SLIDE_LEFT,);

                    },
                  ),
                  DrawerItem(
                    text: 'Support',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SignOutButton()),
          ),
        ],
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DrawerModel>(context);
    return Material(
      color: primaryColor,
      child: InkWell(
        onTap: () {
          model.signOut();
          UI.navigate(
            context,
            AuthPage(),
            this,
            );

        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: UI.marginStandard),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.input,
                color: Colors.white,
                size: UI.scaleFactorH * 25,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: UI.marginStandardHalf),
              ),
              Text(
                'LogOut',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textScaleFactor: UI.textScaleFactor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final Widget trailing;
  final Function onPressed;
  final Color primaryColor = Color(0xFF20536c);

  DrawerItem({this.text = '', this.trailing, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: UI.marginStandardDouble),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Opacity(
                opacity: 0,
                child: trailing ?? Container(),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 24,
                  color: primaryColor,
                  letterSpacing: 0.7,
                ),
                textScaleFactor: UI.textScaleFactor,
              ),
              trailing ?? Container(),
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
