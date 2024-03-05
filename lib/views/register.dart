import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frames/components/components.dart';
import 'package:frames/constants/color.dart';
import 'package:frames/controllers/auth_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with Components {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Listener(
          behavior: HitTestBehavior.opaque,
          onPointerDown: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animations/auth.json', height: 250.h),
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
                              'Please register to continue',
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
                    customTextField(
                      _emailController,
                      hintText: 'Enter your email address',
                      textInputType: TextInputType.emailAddress,
                      onChanged: (data) {
                        final bool emailValidate = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(data);
                        _authController.isEmailValidate = emailValidate;
                      },
                    ),
                    Gap(10.h),
                    Obx(
                      () => customTextField(
                        _passwordController,
                        hintText: 'Enter your password',
                        obscureText: !_authController.showPassword,
                        suffixIcon: InkWell(
                          onTap: () {
                            _authController.toggleEye();
                          },
                          child: _authController.showPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        onChanged: (data) {
                          final bool passwordValidate = RegExp(
                                  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{8,}$")
                              .hasMatch(data);
                          _authController.isPasswordValidate = passwordValidate;
                        },
                      ),
                    ),
                    Gap(10.h),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: _authController.isEmailValidate &&
                                  _authController.isPasswordValidate
                              ? () {}
                              : null,
                          child: const Text('REGISTER'),
                        ),
                      ),
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                        ),
                        Gap(10.w),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'Login now',
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
