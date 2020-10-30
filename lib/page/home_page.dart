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
  final Color primaryColor = Color(0xFF20536c);
  var h;


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    h = MediaQuery.of(context).size.height;
    return Container(
      child: Container(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: primaryColor,
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
              ),

              ListView.builder(
                  itemCount: model.medicalCard.length,
                  itemBuilder:(BuildContext context, int index) => buildMedicalReminderCard(model, index, context)
              )
            ],
          ),
          
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            backgroundColor: primaryColor,
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
      padding: EdgeInsets.symmetric(vertical: UI.marginStandardHalf,horizontal: UI.marginStandard),
      child: buildCardInfo(model, index),
    );
  }

  Widget buildCardInfo(HomeModel model, int index) {
    return Container(
      height: h * 0.22,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fon.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1), BlendMode.dstATop)),
        border: Border.all(color:primaryColor.withOpacity(0.3)),
        borderRadius:  BorderRadius.circular(30.0),
      ),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: UI.marginStandard, vertical: UI.marginStandardHalf),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: UI.marginStandard,),
              child: Row(
                children: [
                  Text(
                    model.medicalCard[index].name + " - " + model.medicalCard[index].dosage + " mg" ,
                    style: TextStyle(color: primaryColor, fontSize: 22 * UI.textScaleFactor, fontWeight:FontWeight.bold ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top:UI.marginStandardHalf),
                    child: Icon(
                      IconData(model.iconValue(model.medicalCard[index].type), fontFamily: "Ic"), //"GalleryIcons"
                      size: 40 * UI.textScaleFactor,
                      color:  primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Reception interval every :',
                    style: TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        fontSize: 14*UI.textScaleFactor)),
                Text(model.medicalCard[index].interval + " h",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 16*UI.textScaleFactor),),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Start:',
                    style:
                    TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        fontSize: 14*UI.textScaleFactor)),
                Text(
                  '${DateFormat('dd/MM/yyyy').format(model.medicalCard[index].startTime).toString()}',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 16*UI.textScaleFactor),)
              ],

            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: UI.marginStandardHalf),
                  child: IconButton(icon: Icon(
                    model.medicalCard[index].isAlarm?
                    Icons.add_alert:Icons.add_alert_outlined,color: primaryColor,),
                  onPressed:() {

                    model.updateAlert(model.medicalCard[index].isAlarm,index);
                  },),
                )
              ],
            ),
          ],
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
