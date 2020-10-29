import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/page/new_entry_page.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/home_model.dart';
import 'package:medical_reminder/widget/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Container(
      child: Container(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF20536c),
            ),
            title: CustomAppBar(),
            brightness: Brightness.light,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/fon.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.1), BlendMode.dstATop))),
                //decoration: ScreenDecoration(),
                // child: Column(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: <Widget>[
                //     Flexible(
                //       flex: 6,
                //       child: TopContainer(),
                //     ),
                //     SizedBox(
                //       height: 10 * UI.scaleFactorH,
                //     ),
                //     Flexible(
                //       flex: 11,
                //       child: Center(
                //           child: Text(
                //         model.mainTitle,
                //         style: TextStyle(
                //           fontSize: 18 * UI.scaleFactorH,
                //           color: Colors.grey[400],
                //         ),
                //       )),
                //     ),
                //   ],
                // ),
              ),
              // GridView.count(
              //   crossAxisCount: 2,
              //   children:
              //   List.generate(model.medList.length, (index) => buildMedicalReminderCard(model, index, context)
              //   ),
              //
              //
              // ),
              ListView.builder(
                  itemCount: model.medicalCard.length,
                  itemBuilder:(BuildContext context, int index) => buildMedicalReminderCard(model, index, context)
              )
            ],
          ),
          
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            backgroundColor: Color(0xFF20536c),
            //Color(0xFF3EB16F), //Color(0xFF3EB16F),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
              ),
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
        ),
      ),
    );
  }

  Widget buildMedicalReminderCard(HomeModel model, int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.marginStandardHalf),
      child: buildCardInfo(model, index),
    );
  }

  Widget buildCardInfo(HomeModel model, int index) {
    return Container(
      height: 150,
      decoration: BoxDecoration(

          image: DecorationImage(
              image: AssetImage('assets/fon.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1), BlendMode.dstATop)),
        border: Border.all(color:Color(0xFF20536c).withOpacity(0.3)),
        borderRadius:  BorderRadius.circular(30.0),


      ),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                 // Text("Medicene name: "),
                  Text(
                    model.medicalCard[index].name + " - " + model.medicalCard[index].dosage + " mg" ,
                    style: TextStyle(color: Color(0xFF20536c), fontSize: 22 * UI.scaleFactorH, fontWeight:FontWeight.bold ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Icon(
                      IconData(model.iconValue(model.medicalCard[index].type), fontFamily: "Ic"), //"GalleryIcons"
                      size: 40 * UI.scaleFactorH,
                      color:  Color(0xFF20536c),
                    ),
                  )
                ],
              ),
            ),
            // Row(
            //   children: [
            //   //  Text('Dosage in mg :'),
            //     Text(model.medicalCard[index].dosage + " mg", style: TextStyle(color: Color(0xFF20536c), fontSize: 20),)
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Reception interval every :', style: TextStyle(color: Color(0xFF20536c).withOpacity(0.7), fontSize: 14)),
                Text(model.medicalCard[index].interval + " h", style: TextStyle(color: Color(0xFF20536c), fontSize: 16),),

              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Start:',style: TextStyle(color: Color(0xFF20536c).withOpacity(0.7), fontSize: 14)),
                Text(
                  '${DateFormat('dd/MM/yyyy').format(model.medicalCard[index].startTime).toString()}',
                  style: TextStyle(color: Color(0xFF20536c), fontSize: 16),)

              ],

            ),



          ],
        ),
      ),

      // child: Card(
      //   elevation:5,
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(color:  Color(0xFF20536c).withOpacity(0.5), width: 1),
      //
      //     borderRadius: BorderRadius.circular(50.0),
      //
      //   ),
      //
      //   child: Center(child: Text(model.medList[index], style: TextStyle(color: Color(0xFF20536c), fontSize: 20),)),
      //           ),
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
          bottomLeft: Radius.elliptical(50, 50),
          bottomRight: Radius.elliptical(50, 50),
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
                "Medication reminder",
                style: TextStyle(
                  fontFamily: 'Faustina',
                  //'Italianno',//'Arizonia',//'PermanentMarker',
                  fontSize: 40 * UI.scaleFactorH,
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
