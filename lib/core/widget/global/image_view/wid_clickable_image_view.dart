import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/core/values/constants.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/wid_button_static.dart';
import 'package:bs_assignment/core/widget/global/image_view/model_image.dart';
import 'package:bs_assignment/core/widget/global/image_view/wid_gallery_view.dart';
import 'package:bs_assignment/core/widget/global/modal/base_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;

class WidgetClickableImageView extends StatelessWidget {
  const WidgetClickableImageView({
    Key? key,
    required this.image,
    this.popView = false,
    this.onPressedDelete,
    this.backgroundColor,
    this.margin = const EdgeInsets.only(bottom: 20),
    this.borderRadius = 3,
    this.border,
    this.initialIndex = 0,
    this.images = const [],
    this.isText=false,
    this.onGallerySwipe,
  }) : super(key: key);

  final String image;
  final bool popView;
  final VoidCallback? onPressedDelete;
  final EdgeInsetsGeometry margin;
  final Color? backgroundColor;
  final double borderRadius;
  final BoxBorder? border;
  final int initialIndex;
  final List<Images> images;
  final Function(int)? onGallerySwipe;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (image.isEmpty) return;
        if (popView) {
          BaseModal.show(
            context: context,
            elevation: 0,
            shadowColor: Colors.transparent,
            barrierDismissible: true,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.black,
            height: MediaQuery.of(context).size.height - 150,
            child: WidgetImageGallery(
              index: initialIndex,
              imagesList: (images.isEmpty) ? [Images(image: image)] : images,
              onPageChanged: onGallerySwipe,
            ),
          );
        } else {
          getx.Get.to(() {
            return WidgetImageGallery(
              index: initialIndex,
              imagesList: (images.isEmpty) ? [Images(image: image)] : images,
              onPageChanged: onGallerySwipe,
            );
          }, transition: getx.Transition.fadeIn, duration: AppDuration.milliseconds300);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        margin: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            children: [
              FN.imageWidgetFromBase64(
                image,
                filterOutBefore: AppConstant.base64FilterString,
                width: double.infinity,
                height: (MediaQuery.of(context).size.height - 150) / 3,
                fit: BoxFit.contain,
                isText: isText,
                onErrorDefaultPlaceholder: true,
              ),
              if (onPressedDelete != null)
                Positioned(
                  right: 10,
                  top: 10,
                  child: PhysicalModel(
                    color: Colors.white,
                    // elevation: 4,
                    shadowColor: AppColor.blackOpacity70000000,
                    borderRadius: BorderRadius.circular(20),
                    child: AppStaticButton(
                      onPressed: onPressedDelete,
                      backgroundColor: AppColor.whiteFFFFFF.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                      height: 32,
                      width: 32,
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
