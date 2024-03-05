import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frames/constants/color.dart';
import 'package:frames/controllers/auth_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.poppins(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        Text(
                          '3Frames Software Labs',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(40.h),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      _authController.handleEmailPasswordLogout();
                    },
                    child: const Text('LOGOUT'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
