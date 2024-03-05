import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frames/constants/color.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

class Components {
  @swidget
  Widget customTextField(
    TextEditingController controller, {
    String hintText = '',
    String labelText = '',
    bool obscureText = false,
    textInputType = TextInputType.text,
    double height = 50,
    double width = double.infinity,
    Widget? suffixIcon,
    double left = 20,
    double right = 0,
    double top = 0,
    double bottom = 0,
    Function(String)? onChanged,
  }) {
    return Container(
      color: Colors.transparent,
      width: width.w,
      height: height.h,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: kPrimaryColor,
        onChanged: onChanged,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w500, fontSize: 16.sp, color: kPrimaryColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: top.h, left: left.w, right: right.w, bottom: bottom.h),
          suffixIcon: suffixIcon,
          suffixIconColor:
              MaterialStateColor.resolveWith((states) => kPrimaryColor),
          errorStyle: const TextStyle(height: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          filled: true,
          fillColor: kPrimaryColor.withOpacity(.1),
          label: Text(hintText),
          labelStyle: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: kPrimaryColor),
        ),
      ),
    );
  }
}
