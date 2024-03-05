import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Loader {
  Loader._();

  static show() {
    Get.dialog(
        Center(
          child: Container(
            color: Colors.transparent,
            width: 300.h,
            height: 300.h,
            child: Lottie.asset(
              'assets/animations/loader.json',
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.black38);
  }

  static hide() {
    Get.back();
  }
}
