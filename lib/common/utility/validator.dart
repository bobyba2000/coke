import 'package:coke_platform/generated/l10n.dart';

mixin class Validator {
  static final RegExp _phoneRegex = RegExp(r'(\+84|0)\d{9}$');
  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String? checkPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null) {
      return S.current.inputRequired;
    }
    if (phoneNumber.trim().isEmpty) {
      return S.current.pleaseInputPhoneNumber;
    } else if (!_phoneRegex.hasMatch(phoneNumber.trim())) {
      return S.current.invalidPhoneNumber;
    } else {
      return null;
    }
  }

  String? checkEmail(String? email) {
    if (email == null) {
      return S.current.pleaseInputEmail;
    }
    if (email.isEmpty) {
      return S.current.pleaseInputEmail;
    } else if (!_emailRegex.hasMatch(email.trim())) {
      return S.current.invalidEmail;
    } else {
      return null;
    }
  }

  String? checkRequired(String? value) {
    if (value == '' || value == null) {
      return S.current.inputRequired;
    }
    return null;
  }
}
