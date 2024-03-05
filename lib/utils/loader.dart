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
              width: 150.h,
              height: 150.h,
              child: Lottie.asset('assets/animations/loader.json')),
        ),
        barrierDismissible: false,
        barrierColor: Colors.black38);
  }

  static hide() {
    Get.back();
  }
}
