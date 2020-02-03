import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_reminder/page/new_entry_page.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Container(
      child: Container(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              Container(
                decoration: ScreenDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      flex: 6,
                      child: TopContainer(),
                    ),
                    SizedBox(
                      height: 10 * UI.scaleFactorH,
                    ),
                    Flexible(
                      flex: 11,
                      child: Center(
                          child: Text(
                        model.mainTitle,
                        style: TextStyle(
                          fontSize: 18 * UI.scaleFactorH,
                          color: Colors.grey[400],
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            elevation: 4,
            backgroundColor: Color(0xFF20536c),
            //Color(0xFF3EB16F), //Color(0xFF3EB16F),
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewEntryPage(),
                ),
              );
            },
          ),

//          Container(
//            height: 92 * UI.scaleFactorH,
//            width: 175 * UI.scaleFactorH,
//            child: Column(
//              children: <Widget>[
//                GradientButton(
//                    child: Icon(
//                      Icons.add,
//                      color: Colors.white,
//                      size: 28 * UI.scaleFactorH,
//                    ),
//
////                    child: Text(
////                      "ADD",
////                      style: TextStyle(
////                          color: Colors.white, fontWeight: FontWeight.w800),
////                    ),
//                    gradient:
//                        CustomGradient(Color(0xFFB0F3CB), Color(0xFF3EB16F)),
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => NewEntryPage(),
//                        ),
//                      );
//                    }),
//              ],
//            ),
//          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Material(
        child: //SafeArea(
            Container(
      decoration: BoxDecoration(
        //gradient: CustomGradient(Color(0xFFB0F3CB), Color(0xFF3EB16F)),
        //Color(0xFF8aedb4)
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 27),
          bottomRight: Radius.elliptical(50, 27),
        ),
        //   border:  Border.all(color: Color(0xFFB0F3CB),),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Color(0xFF20536c), //Color(0xFF3EB16F),
      ),
      // width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 20 * UI.scaleFactorH),
              child: Text(
                "Mediminder",
                style: TextStyle(
                  fontFamily: 'Arizonia',
                  //'Italianno',//'Arizonia',//'PermanentMarker',
                  fontSize: 55 * UI.scaleFactorH,
                  color: Colors.white,
                  //color: Color(0xFF3EB16F), //Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xFFB0F3CB),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 8 * UI.scaleFactorH, bottom: 8 * UI.scaleFactorH),
            child: Center(
              child: Text(
                "Number of Mediminders",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 16 * UI.scaleFactorH,
                  color: Colors
                      .white, //color: Color(0xFF3EB16F), // color: Color(0xFF3EB16F)
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 8 * UI.scaleFactorH, bottom: 8 * UI.scaleFactorH),
            child: Center(
              child: Text(
                model.numberMed,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 24 * UI.scaleFactorH,
                  fontWeight: FontWeight.bold,
                  //color: Color(0xFF3EB16F)
                  color: Colors.white,
                  //  color: Colors.white,
                ),
              ),
            ),
          ),

//          StreamBuilder<List<Medicine>>(
//            stream: globalBloc.medicineList$,
//            builder: (context, snapshot) {
//              return Padding(
//                padding: EdgeInsets.only(top: 16.0, bottom: 5 ),
//                child: Center(
//                  child: Text(
//                    !snapshot.hasData ? '0' : snapshot.data.length.toString(),
//                    style: TextStyle(
//                      fontFamily: "Neu",
//                      fontSize: 28,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//              );
//            },
//          ),
        ],
      ),
    )

        //),
        );
  }
}
