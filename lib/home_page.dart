import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Scaffold(
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
                    flex: 4,
                    child: TopContainer(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    flex: 7,
                    child: Center(
                        child: Text(
                      model.mainTitle,
                      style: TextStyle(fontSize: 22,   color: Colors.grey[400],),
                    )),
                  ),
                ],
              ),
            ),

          ],
        ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Color(0xFF3EB16F),
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => {},
//            ),
//          );
        },
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
        color: Colors.white, //Color(0xFF3EB16F),
      ),
      // width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Mediminder",
                style: TextStyle(
                  fontSize: 64,
                  color: Color(0xFF3EB16F), //Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xFFB0F3CB),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Center(
              child: Text(
                "Number of Mediminders",
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF3EB16F), // color: Color(0xFF3EB16F)
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16.0, bottom: 5),
            child: Center(
              child: Text(
                model.numberMed,
                style: TextStyle(
                    fontFamily: "Neu",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3EB16F)
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
