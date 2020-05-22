import 'package:flutter/material.dart';
import 'package:medical_reminder/util/enums/medicine_type.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:provider/provider.dart';

class MedicineTypeColumn extends StatelessWidget {
  final MedicineType type;
  final String name;
  final int iconValue;
  final bool isSelected;

  MedicineTypeColumn(
      {Key key,
      @required this.type,
      @required this.name,
      @required this.iconValue,
      @required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewEntryModel _newEntryModel = Provider.of<NewEntryModel>(context);
    return GestureDetector(
      onTap: () {
        _newEntryModel.updateSelectedMedicine(type);
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 88 * UI.scaleFactorW,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Color(0xFF20536c) : Colors.transparent,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Icon(
                  IconData(iconValue, fontFamily: "Ic"), //"GalleryIcons"
                  size: 65 * UI.scaleFactorH,
                  color: isSelected ? Colors.white : Color(0xFF20536c),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF20536c) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Color(0xFF20536c),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
