import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool _showPassword = false.obs;
  final RxBool _isEmailValidate = false.obs;
  final RxBool _isPasswordValidate = false.obs;

  bool get showPassword => _showPassword.value;
  bool get isEmailValidate => _isEmailValidate.value;
  bool get isPasswordValidate => _isPasswordValidate.value;

  toggleEye() {
    _showPassword.value = !_showPassword.value;
  }

  set isEmailValidate(bool status) => _isEmailValidate.value = status;
  set isPasswordValidate(bool status) => _isPasswordValidate.value = status;
}
