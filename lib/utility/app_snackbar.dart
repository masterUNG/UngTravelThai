import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  void redSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.red.shade700,
      colorText: Colors.white,
    );
  }
}
