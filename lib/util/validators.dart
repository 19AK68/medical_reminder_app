import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


/// Because Validation must be 'nested' to remove Errors during editing of Fields
/// we ended up with combination of multiple Validators
class Validators {
  static String validateRequired(value, lastSavedValue, BuildContext context) {
    var trimmed = value.toString().trim();
    if (lastSavedValue != trimmed) {
      return null;
    }
    if (FormBuilderValidators.required()(trimmed) != null) {
      return "Field required";//AppLocalizations.of(context).fieldRequired;
    }
    return null;
  }

  static String validatePhone(value, lastSavedValue, BuildContext context) {
    if (lastSavedValue != value) {
      return null;
    }
    if (FormBuilderValidators.required()(value) != null) {
      return "Field required";//return AppLocalizations.of(context).fieldRequired;
    }
    if (FormBuilderValidators.minLength(10)(value) != null) {
      return "Field required";// return AppLocalizations.of(context).invalidPhoneNumber;
    }

    return null;
  }

  static String validatePassword(value, lastSavedValue, BuildContext context) {
    if (lastSavedValue != value) {
      return null;
    }
    if (FormBuilderValidators.required()(value) != null) {
      return "Field required";//return AppLocalizations.of(context).fieldRequired;
    }
    if (FormBuilderValidators.minLength(6)(value) != null) {
      return "Field required";// return AppLocalizations.of(context).passwordTooShort;
    }
    return null;
  }

  static String validateEmail(value, lastSavedValue, BuildContext context) {
    if (lastSavedValue != value) {
      return null;
    }
    if (FormBuilderValidators.required()(value) != null) {
      return "Field required";// return AppLocalizations.of(context).fieldRequired;
    }
    if (FormBuilderValidators.email()(value) != null) {
      return "Field required";// return AppLocalizations.of(context).enterValidEmail;
    }
    return null;
  }

  static String validateCompare(
      value, value2, lastSavedValue, BuildContext context) {
    if (value != lastSavedValue) {
      return null;
    }
    if (FormBuilderValidators.required()(lastSavedValue) != null) {
     return "Field required";// return AppLocalizations.of(context).fieldRequired;
    }
    if (FormBuilderValidators.minLength(6)(lastSavedValue) != null) {
      return "Field required";// return AppLocalizations.of(context).passwordTooShort;
    }
    if (value != value2) {
      return "Field required";//  return AppLocalizations.of(context).passwordsNotMatch;
    }
    return null;
  }
}