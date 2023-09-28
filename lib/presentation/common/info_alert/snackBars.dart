import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBars {
  static _snackbar({
    required String leadingText,
    required String messageText,
    required Color backgroundColor,
  }) {
    return Get.snackbar(
      leadingText,
      messageText,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      borderRadius: 0,
      backgroundColor: backgroundColor,
    );
  }

  static failureSnackbar(leadingText, messageText) {
    return _snackbar(
      leadingText: leadingText,
      messageText: messageText,
      backgroundColor: Colors.red.shade300,
    );
  }

  static successSnackbar(leadingText, messageText) {
    return _snackbar(
      leadingText: leadingText,
      messageText: messageText,
      backgroundColor: Colors.green,
    );
  }
}