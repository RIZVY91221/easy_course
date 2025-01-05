import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/app_string.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/features/auth/signin/controller/login_controller.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseView<LoginController> {
  LoginScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColor.primaryOne4B9EFF;
  }

  @override
  Color statusBarColor() {
    return AppColor.primaryOne4B9EFF;
  }


  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [

        /// Content
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppGap.vertical(MediaQuery.of(context).size.height / 8),

              /// Logo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: appSVG(
                  Assets.svgHomeIcon,
                  size: 200,
                  width: Get.width / 2,
                ),
              ),

              AppGap.vertical(MediaQuery.of(context).size.height / 10),

              /// Bottom Container (Sign-In Form)
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  color: AppColor.primaryTwo10CCE4,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Card(
                  color: AppColor.primaryTwo10CCE4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGap.vertical20,
                        Center(
                          child: AppText.headline3(
                            "Sign In",
                            color: AppColor.whiteFFFFFF,
                          ),
                        ),
                        AppGap.vertical20,

                        /// Email Input Field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: AppText.bodyVerySmall(
                            "Email",
                            color: AppColor.secondaryToneFiveE4F7F6,
                          ),
                        ),
                        Obx(
                              () => BaseTextInput(
                            hintText: AppString.email,
                            elevation: 5,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (String? val) =>
                                controller.inputTextTypingMonitor(),
                            onFocusChange: (val) =>
                                controller.inputTextTypingMonitor(),
                            error: controller.isEmailInvalid.value,
                            controller: controller.emailTextEditingController,
                          ),
                        ),
                        AppGap.vertical10,

                        /// Password Input Field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: AppText.bodyVerySmall(
                            "Password",
                            color: AppColor.secondaryToneFiveE4F7F6,
                          ),
                        ),
                        Obx(
                              () => BaseTextInput(
                            hintText: AppString.password,
                            elevation: 5,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (String? val) =>
                                controller.inputTextTypingMonitor(),
                            onFocusChange: (val) =>
                                controller.inputTextTypingMonitor(),
                            error: controller.isEmailInvalid.value,
                            controller: controller.passwordTextEditingController,
                            obscureText: true,
                          ),
                        ),
                        AppGap.vertical10,

                        /// Forgot Password Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextPrimaryButton(
                              text: AppString.forgotPassword,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        AppGap.vertical20,

                        /// Login Button
                        Obx(
                              () => DefaultPrimaryButton(
                            onPressed: () async => await controller.login(),
                            disable: controller.isButtonDisabled.value,
                            buttonRound: ButtonRound.halfRounded,
                            backgroundColor: AppColor.loginButtonColor,
                            child: Text(
                              AppString.login,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColor.dark202125),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

