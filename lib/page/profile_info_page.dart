
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/services/database_services.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/profile_info_model.dart';
import 'package:medical_reminder/widget/base_dialog_content_widget.dart';
import 'package:medical_reminder/widget/costom_dialog_border.dart';
import 'package:medical_reminder/widget/custom_appbar_widget.dart';
import 'package:medical_reminder/widget/update_single_value_widget.dart';
import 'package:medical_reminder/models/profile_details.dart';
import 'package:provider/provider.dart';

class ProfileIntoPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);
  final Color _white = Colors.white;
  final String _name = 'name';
  final String _email = 'e-mail';
  final DataBaseServices dataBaseServices = DataBaseServices();
  static TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var data = dataBaseServices.getDataProfile();

    final model = Provider.of<ProfileInfoModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        title: Center(
          child: Text('Profile Into Page',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: primaryColor)),
        ),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.only(right: 16),
        //     child: GestureDetector(
        //       onTap: () {},
        //       child: Icon(
        //         Icons.edit,
        //         size: 26.0,
        //       ),
        //     ),
        //   )
        //
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: UI.marginStandardDouble,
                horizontal: UI.marginStandard),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    SizedBox(
                      width: UI.marginStandard,
                    ),
                    buildFutureBuilderDetails(_name),
                  ],
                ),
                InkWell(
                    onTap: () {
                      var nameDetails = model.getProf();
                      model.lastEnteredValue = nameDetails;
                      var initTextValue = (nameDetails == null)? "Unknow":nameDetails;

                      inputDialogSendMessage(context, initTextValue);

                      // showDialog(
                      //     context: context,
                      //     builder: (_) {
                      //       var nameDetails = model.getProf();
                      //       model.lastEnteredValue = nameDetails;
                      //       return CustomDialogBorder(
                      //
                      //
                      //       )
                      //
                      //       // return SinglEditText(
                      //       //     title: "Change Name",
                      //       //     controller:_nameController,
                      //       //     initialValue: (nameDetails == null)
                      //       //         ? 'Unknow'
                      //       //         : nameDetails,
                      //       //     maxLength: 20,
                      //       //     );
                      //
                      //       //     UpdateSingleValueWidget(
                      //       //     initialValue:
                      //       //     (nameDetails==null)? 'Unknow':nameDetails,
                      //       //     title: "Change Name",
                      //       //     maxLength: 20,
                      //       //     updateFunction: model.changeName( nameDetails),
                      //       //   );
                      //     });
                    },
                    child: Icon(Icons.edit)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: UI.marginStandardDouble,
                horizontal: UI.marginStandard),
            child: Row(
              children: [
                Text(
                  'Email :',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  width: UI.marginStandard,
                ),
                buildFutureBuilderDetails(_email),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void inputDialogSendMessage(BuildContext context,String initText) {
    final maxLines = 1;

    showDialog(
      context: context,
      builder: (_) => CustomDialogBorder(
        Padding(
          padding: EdgeInsets.symmetric(vertical: UI.marginStandard),
          child: BaseDialogContentWidget(
            title: "Change Name",
            content: Padding(
              padding: EdgeInsets.only(top: UI.marginStandardDouble),
              child: textFieldContainer(maxLines,  initText),
            ),
            bottom: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: UI.marginStandard,
                  horizontal: UI.marginStandardDouble * 2),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:UI.marginStandardDouble),
                    child: GradientButton(
                      text: "Save",
                      textColor: _white,
                      gradient: CustomGradient(),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container textFieldContainer(int maxLines,String initText) {
    return Container(
      height: maxLines * UI.marginStandardDouble,
      child: TextFormField(

        maxLines: maxLines,
        initialValue: initText,
        decoration: InputDecoration(

          //hintText: 'Enter text message',
         // hintStyle: TextStyle(color: primaryColor.withOpacity(0.5)),
    enabledBorder:UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor.withOpacity(0.5)
        ),),
          focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor
    ),
          ),
        ),
        style: TextStyle(color: primaryColor ,fontSize: 20),
      ),
    );
  }

 // buildFutureBuilderDetails(String name) {}

  FutureBuilder<DocumentSnapshot> buildFutureBuilderDetails(String param) {
    return FutureBuilder<DocumentSnapshot>(
      future: dataBaseServices.userData(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          UI.showMessage(context, "Something went wrong");
          return null;
        }

        if (snapshot.connectionState == ConnectionState.done) {
          var details = snapshot.data.data();

          return Text(
            " ${(details[param] == null) ? 'Unknown' : details[param]} ",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: primaryColor),
          );
        }

        return Text("loading");
      },
    );
  }
}
