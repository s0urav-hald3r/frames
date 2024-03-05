import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool _showPassword = false.obs;

  bool get showPassword => _showPassword.value;

  toggleEye() {
    _showPassword.value = !_showPassword.value;
  }
}
