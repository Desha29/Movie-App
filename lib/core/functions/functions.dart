import 'package:flutter/material.dart';
import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not valid email";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(value)) {
      return "Not valid Input enter numbers only";
    }
  }
  if (value.isEmpty) {
    return "can't be Empty!";
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be larger than $max";
  }
}

showMessege({required String msg, required Color color}) => (SnackBar(
      content: Text(msg),
      backgroundColor: color,
    ));
