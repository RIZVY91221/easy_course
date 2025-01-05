import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/values/app_string.dart';
import 'package:bs_assignment/environment/environment.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final BaseRepository repository;

  LoginController({required this.repository});

  /* Text Controllers */
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  /* Validation Variables */
  RxString errorMsg = ''.obs;
  Color? errorMessageColor;
  RxBool isShowToast = false.obs;
  RxBool isButtonDisabled = true.obs;
  RxBool isEmailInvalid = false.obs;
  RxBool isButtonPressedOnce = false.obs;

  /// Reset Method
  void reset() {
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    errorMsg.value = '';
    isButtonDisabled.value = true;
    isEmailInvalid.value = false;
    isButtonPressedOnce.value = false;
  }

  /// Button Active Status depending on typing or empty
  inputTextTypingMonitor() {
    // Checking if fields are not empty
    if (passwordTextEditingController.text.isNotEmpty && emailTextEditingController.text.isNotEmpty) {
      isButtonDisabled.value = false;
    } else {
      isButtonDisabled.value = true;
    }

    // If button is pressed once
    // email validation function will run and repeat this process when pressed
    if (isButtonPressedOnce.value) emailValidation();
  }

  /// Email validation
  bool emailValidation() {
    if (!emailTextEditingController.text.isEmail) {
      isEmailInvalid.value = true;
    } else {
      isEmailInvalid.value = false;
    }
    return isEmailInvalid.value ? false : true;
  }

  /// After verification is complete callback
  afterVerification() {
    errorMsg.value = AppString.verificationSuccess;
    errorMessageColor = AppColor.secondaryFive00A092;
  }

  /// Login Method
  Future<void> login() async {
    // set Button Pressed status true as button is pressed to login
    isButtonPressedOnce.value = true;

    // setting errorMessage empty
    errorMsg.value = '';

    emailValidation();

    // making 'errorMessageColor' null as it is changed at 'afterVerification()'
    if (errorMessageColor != null) errorMessageColor = null;

    //Sending Login POST request
    await repository.postLogin(emailTextEditingController.text, passwordTextEditingController.text).then((response) async {
      if (response.token != null) {
        await repository.setAccessToken(response.token ?? '');
        //TODO: Add route page here :example
        Get.offAllNamed(AppRoutes.HOME_SCREEN);
      }
    });
  }

  /// <span style="color:orange">Logout</span>
  Future<void> logOut() async {
    // Don't need to check if post request is success, proceed to other process
    //Remove all related data from database, token, email, verifications
    //await repository.logout();
    // cleaning up error messages if any
    errorMsg.value = '';
    // navigating to login page
  }

  postFrameMethod() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      emailTextEditingController.text = Env.loginEmail;
      passwordTextEditingController.text = Env.loginPassword;
    });
  }

  @override
  void onInit() {
    postFrameMethod();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
