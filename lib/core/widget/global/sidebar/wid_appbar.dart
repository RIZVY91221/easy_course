import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';

AppBar baseAppBar({
  String title = '',
  Widget? titleWidget,
  Color? titleColor,
  bool modalView = false,
  bool titleCenter = true,
  bool defaultActionButton = false,
  List<Widget>? actionButtons,
  Widget? leading,
  bool leadingArrow = false,
  bool showBorderBottom = true,
  Color? leadingArrowColor,
  bool hideLeading = true,
  Color? backgroundColor,
  Widget? defaultActionButtonIcon,
  VoidCallback? onPressedDefaultActionButton,
  VoidCallback? onPressedLeading,
  double? toolbarHeight
}) {
  return AppBar(
    title: titleWidget ?? AppText.headline5(title, color: titleColor ?? AppColor.whiteFFFFFF),
    titleSpacing: 0,
    toolbarHeight: toolbarHeight??60.0,
    elevation: 0.0,
    leading: leadingArrow
        ? TextPrimaryButton(
            onPressed: onPressedLeading ?? () => Get.back(),
            splashEnabled: true,
            backgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: leadingArrowColor ?? (modalView ? AppColor.dark202125 : AppColor.whiteFFFFFF),
              size: AppSize.s24,
            ),
          )
        : hideLeading
            ? Container()
            : leading??const Icon(Icons.menu),
    centerTitle: modalView ? (titleCenter ? titleCenter : !modalView) : titleCenter,
    backgroundColor: modalView ? AppColor.whiteFFFFFF : backgroundColor,
    titleTextStyle: modalView
        ? AppTextStyle.headline5(
            color: AppColor.dark202125,
          )
        : null,
    iconTheme: modalView
        ? IconThemeData(
            color: AppColor.dark202125,
          )
        : null,
    // systemOverlayStyle: SystemUiOverlayStyle(),
    // leadingWidth: AppSize.s40,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: Container(
        height: showBorderBottom ? 1 : 0,
        color: showBorderBottom ? AppColor.blackOpacity10000000 : AppColor.transparent,
      ),
    ),
    actions: defaultActionButton
        ? [
            IconButton(
              onPressed: onPressedDefaultActionButton,
              icon: defaultActionButtonIcon ?? Icon(Icons.add, color: modalView ? AppColor.dark202125 : null),
            ),
            const SizedBox(width: AppSize.s5),
          ]
        : actionButtons,
  );
}
