import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ValidateTextField on TextEditingController {
  bool isEmpty() {
    return text.isEmpty;
  }

  bool isNotEmpty() {
    return text.isNotEmpty;
  }

  bool isEmail() {
    return text.trim().isEmail;
  }

  int len() {
    return text.trim().length;
  }

  bool isPassword() {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{8,}$")
        .hasMatch(text.trim());
  }

  String getValue() {
    return text.trim();
  }

  int? getValueAsInt() {
    return int.tryParse(text.trim());
  }
}
