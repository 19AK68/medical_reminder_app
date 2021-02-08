import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medical_reminder/util/enums/login_input_field.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/util/validators.dart';
import 'package:medical_reminder/view_model/profile_info_model.dart';
import 'package:medical_reminder/widget/confirm_dialog_widget.dart';
import 'package:medical_reminder/widget/costom_dialog_border.dart';
import 'package:medical_reminder/widget/custom_fext_field.dart';
import 'package:medical_reminder/widget/field_input_widget.dart';
import 'package:provider/provider.dart';

class UpdateSingleValueWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final String initialValue;
  final String title;
  final String description;
  final int maxLength;
  final Function updateFunction;
  final String Function(String) validator;

  UpdateSingleValueWidget({
    Key key,
    @required this.initialValue,
    @required this.title,
    this.description,
    this.maxLength,
    @required this.updateFunction,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileInfoModel>(context, listen: false);
    return CustomDialogBorder(
      ConfirmationDialogWidget(
        title: title,
        content: Column(
          children: <Widget>[
            FormBuilder(
              key: _fbKey,
              child: CustomTextField(
                attribute: 'updateSingleValue',
                initialValue: initialValue ?? '',
                maxLength: maxLength,
                validator: validator ??
                    (value) => Validators.validateRequired(
                        value, model.lastEnteredValue, context),
                onSaved: (val) =>
                    model.lastEnteredValue = val.toString().trim(),
              ),
            ),
            Visibility(
              visible: description != null,
              child: Padding(
                padding: EdgeInsets.only(top: UI.marginStandardDouble),
                child: Text(
                  description ?? '',
                  style: TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w400,
                  ),
                  textScaleFactor: UI.textScaleFactor,
                ),
              ),
            ),
          ],
        ),
        yesButtonTitle: "Yes",
        onYesPressed: () {
          if (_fbKey.currentState.saveAndValidate()) {
            updateFunction().then((value) {
              if (value != null) {
                UI.showMessage(context, value);
              } else {
                // userModel.fetchUser(refresh: true);
                Navigator.of(context).pop();
              }
            });
          }
        },
      ),
    );
  }
}

class SinglEditText extends StatelessWidget {
  final String initialValue;
  final String title;
  final TextEditingController controller;
  final int maxLength;


  const SinglEditText(
      {Key key,
      @required this.initialValue,
      @required this.title,
        this.controller,
      this.maxLength,
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileInfoModel>(context, listen: false);
    return CustomDialogBorder(
      ConfirmationDialogWidget(
        title: title,
        content: Column(
          children: <Widget>[
            Padding(
              //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              padding: EdgeInsets.only(bottom: 20, top: 20),


              child: InputField(
                inputField: LoginInputField.NAME,
                initialValue:initialValue,
                isBorder: false,

                errorText: model.name.error,
                controller:controller,
                obsecure: false,
                onChanged: (String value) {
                  model.upName(value);
                },
              ),
            ),


          ],
        ),
        yesButtonTitle: "Yes",
        onYesPressed: () {
          model.changeName(controller.text.trim());

        },
      ),
    );
  }

}
