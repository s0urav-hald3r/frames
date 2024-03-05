import 'package:firebase_auth/firebase_auth.dart';
import 'package:frames/utils/loader.dart';
import 'package:frames/utils/snackbar.dart';
import 'package:frames/views/home.dart';
import 'package:frames/views/login.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        isLoggedIn = true;
      }
    });
  }

  final RxBool _isLoggedIn = false.obs;
  final RxBool _showPassword = false.obs;
  final RxBool _isEmailValidate = false.obs;
  final RxBool _isPasswordValidate = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;
  bool get showPassword => _showPassword.value;
  bool get isEmailValidate => _isEmailValidate.value;
  bool get isPasswordValidate => _isPasswordValidate.value;

  toggleEye() {
    _showPassword.value = !_showPassword.value;
  }

  set isLoggedIn(bool status) => _isLoggedIn.value = status;
  set isEmailValidate(bool status) => _isEmailValidate.value = status;
  set isPasswordValidate(bool status) => _isPasswordValidate.value = status;

  handleEmailPasswordRegister(String email, String password) async {
    Loader.show();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Loader.hide();
      CustomSnackBar.show('Success', message: 'User registered successfully.');
      Get.offAll(() => const HomeView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Loader.hide();
        CustomSnackBar.show('Error', message: 'Invalid email.', type: 2);
      }
      if (e.code == 'email-already-in-use') {
        Loader.hide();
        CustomSnackBar.show('Error',
            message: 'Email already registered.', type: 2);
      }
    } catch (error) {
      Loader.hide();
      CustomSnackBar.show('Error', message: error.toString(), type: 2);
    }
  }

  handleEmailPasswordLogin(String email, String password) async {
    Loader.show();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Loader.hide();
      CustomSnackBar.show('Success', message: 'Successfully logged in.');
      Get.offAll(() => const HomeView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Loader.hide();
        CustomSnackBar.show('Error', message: 'Invalid email.', type: 2);
      }
      if (e.code == 'user-not-found') {
        Loader.hide();
        CustomSnackBar.show('Error', message: 'User not found.', type: 2);
      }
      if (e.code == 'wrong-password') {
        Loader.hide();
        CustomSnackBar.show('Error',
            message: 'You entered wrong password.', type: 2);
      }
    } catch (error) {
      Loader.hide();
      CustomSnackBar.show('Error', message: error.toString(), type: 2);
    }
  }

  handleEmailPasswordLogout() async {
    Loader.show();
    try {
      await _firebaseAuth.signOut();
      Loader.hide();
      Get.offAll(() => const LoginView());
    } catch (error) {
      Loader.hide();
      CustomSnackBar.show('Error', message: error.toString(), type: 2);
    }
  }
}
