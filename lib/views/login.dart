import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frames/components/components.dart';
import 'package:frames/constants/color.dart';
import 'package:frames/controllers/auth_controller.dart';
import 'package:frames/utils/extension.dart';
import 'package:frames/utils/snackbar.dart';
import 'package:frames/views/register.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with Components {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => SafeArea(
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
                      Lottie.asset('assets/animations/auth.json',
                          height: 250.h),
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
                                'Please log in to continue',
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
                      customTextField(_emailController,
                          hintText: 'Enter your email address',
                          textInputType: TextInputType.emailAddress),
                      Gap(10.h),
                      customTextField(
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
                      ),
                      Gap(10.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_emailController.isEmpty()) {
                              CustomSnackBar.show('Warning',
                                  message: 'Email can\'t be empty', type: 1);
                              return;
                            }
                            if (!_emailController.isEmail()) {
                              CustomSnackBar.show('Warning',
                                  message: 'Enter a valid email addess',
                                  type: 1);
                              return;
                            }
                            if (!_passwordController.isPassword()) {
                              CustomSnackBar.show('Warning',
                                  message:
                                      'Password should be 8 caharcter long, conatins an uppercase letter, a lowercase letter, a number & a special caracter',
                                  type: 1);
                              return;
                            }
                          },
                          child: const Text('LOGIN'),
                        ),
                      ),
                      Gap(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ?',
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor),
                          ),
                          Gap(10.w),
                          InkWell(
                            onTap: () {
                              Get.to(() => const RegisterView());
                            },
                            child: Text(
                              'Register now',
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
      ),
    );
  }
}
