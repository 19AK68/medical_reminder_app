import 'package:flutter/material.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:medical_reminder/widget/medicine_type_widget.dart';
import 'package:medical_reminder/widget/panel_title_widget.dart';
import 'package:medical_reminder/widget/select_time_widget.dart';
import 'package:medical_reminder/widget/selected_interval.dart';
import 'package:provider/provider.dart';

class NewEntryPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewEntryModel>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF20536c), //Color(0xFF3EB16F),
        ),
        centerTitle: true,
        title: Text(
          'Add New Medical Reminder',
          style: TextStyle(
            color: Color(0xFF20536c),
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        //decoration: ScreenDecoration(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: UI.marginStandard),
          children: <Widget>[
            PanelTitle(
                title: "Medicine Name",
                isRequired: true,
                spanColor: Color(0xFF20536c)),
            TextFormField(
              style: TextStyle(fontSize: 16 * UI.scaleFactorH),
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            PanelTitle(
              title: "Dosage in mg",
              isRequired: true,
              spanColor: Color(0xFF20536c),
            ),
            TextFormField(
              controller: dosageController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(
              height: UI.marginStandard,
            ),
            PanelTitle(
                title: "Medicine Type",
                isRequired: false,
                spanColor: Color(0xFF20536c)),
            Container(
              height: 150,
              width: 150,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0 * UI.scaleFactorH),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                   // Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //  children: <Widget>[
                        MedicineTypeColumn(
                            type: MedicineType.Bottle,
                            name: "Bottle",
                            iconValue: 0xe900,
                            isSelected: model.isSelected[MedicineType.Bottle
                                    .index] //model.isSelected[0]//model.updateSelectedMedicine(MedicineType.Bottle)
                                ? true
                                : false),
                        MedicineTypeColumn(
                            type: MedicineType.Pill,
                            name: "Pill",
                            iconValue: 0xe901,
                            isSelected: model.isSelected[MedicineType.Pill
                                    .index] //model.updateSelectedMedicine(MedicineType.Pill)
                                ? true
                                : false),
                        MedicineTypeColumn(
                            type: MedicineType.Syringe,
                            name: "Syringe",
                            iconValue: 0xe902,
                            isSelected: model.isSelected[MedicineType.Syringe
                                    .index] //model.updateSelectedMedicine(MedicineType.Syringe)
                                ? true
                                : false),
                        MedicineTypeColumn(
                            type: MedicineType.Tablet,
                            name: "Tablet",
                            iconValue: 0xe903,
                            isSelected: model.isSelected[MedicineType.Tablet
                                    .index] //model.updateSelectedMedicine(MedicineType.Tablet)
                                ? true
                                : false),
                    //  ],
                    //),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    PanelTitle(
                        title: "Interval Selection",
                        isRequired: true,
                        spanColor: Color(0xFF20536c)),
                    Container(
                        padding: EdgeInsets.only(
                            left: UI.marginStandard,
                            top: UI.marginStandard / 2),
                        child: SelectedInterval()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    PanelTitle(
                        title: "Starting Time",
                        isRequired: true,
                        spanColor: Color(0xFF20536c)),
                  ],
                ),
                SelectTime(),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: UI.marginStandardDouble * 2,
                  horizontal: UI.marginStandardDouble * 2),
              child: FlatButton(
                onPressed: () {},
                color: Color(0xFF20536c),
                shape: StadiumBorder(),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: UI.marginStandard / 2),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}