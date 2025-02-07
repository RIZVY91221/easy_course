import 'dart:convert';
import 'dart:io';

import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/utils/extensions.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/widget/global/text/wid_icon_text.dart';
import 'package:bs_assignment/environment/build_config.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/* Debug Print */
appPrint(dynamic data) => BuildConfig.instance.envVariables.shouldCollectCrashLog ? debugPrint('$data') : '';

class FN extends Deprecated {
  FN(super.message);

  /* Debug Print */
  @Deprecated('Use "appPrint()" instead')
  static print(dynamic data) => appPrint(data);

  /* Combine Error Messages */
  static String getErrorMessageCombined(Map<String, dynamic> errors) {
    int index = 0;
    String message = '';

    errors.forEach((key, value) {
      index++;
      message += value[0];
      if (errors.length != index) {
        message += '\n';
      }
    });
    return message;
  }

  /* ***
   * Convert Base 64 Images into Viewable Widget
   * **/

  static Widget imageWidgetFromBase64(
    String stringBase64, {
    String filterOutBefore = '',
    String filterOutAfter = '',
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
    Color? textColor,
    Widget? onErrorWidget,
    Widget? onErrorPlaceholderWidget,
    AlignmentGeometry? alignment,
    BlendMode? colorBlendMode,
    bool onErrorDefaultPlaceholder = false,
    bool isText = false,
    double borderRadius = 3,
    Function(Object, StackTrace?)? onError,
  }) {
    Container box({Widget? child}) => Container(
          height: height,
          width: width,
          color: color,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        );

    Image noImage = Image.asset(Assets.imagesNoImage);

    /// Check Blank
    if (stringBase64.isEmpty || stringBase64 == 'null') return box(child: onErrorWidget ?? noImage);

    /// When Widget is Text
    if (isText) {
      appPrint('⇢ ⇢ ⇢ Text:  "String"');
      return WidgetIconWithLetter(
        text: stringBase64,
        height: height,
        width: width,
        bgColor: color,
        textColor: textColor,
        borderRadius: borderRadius,
      );
    }

    /// When None of Above
    Uint8List? bytes;

    try {
      bytes = getFromBase64(
        stringBase64,
        filterOutBefore: filterOutBefore,
        filterOutAfter: filterOutAfter,
      );
    } catch (_) {}

    Image? image;

    Widget? svgImage;

    String initializer({int char = 4}) => stringBase64.substring(0, char);

    String extension() {
      String lastTen = stringBase64.substring(stringBase64.length - 10, stringBase64.length);
      String ext = 'base64';
      try {
        ext = lastTen.split('.')[1];
      } catch (_) {}
      return ext;
    }

    Widget errorWidget() => (onErrorDefaultPlaceholder ? noImage : (onErrorPlaceholderWidget ?? const SizedBox.shrink()));

    appPrint('⇢ ⇢ ⇢ Image: "${initializer(char: 6)}◦◦◦.${extension()}"');

    if (extension() == 'svg') {
      if (initializer() == 'http') {
        svgImage = appSVGNetworkComplex(
          stringBase64,
          color: color,
          width: width,
          height: height,
        );
      } else {
        svgImage = appSVG(
          stringBase64,
          color: color,
          width: width,
          height: height,
        );
      }
    } else {
      if (initializer() == 'http') {
        image = Image.network(
          stringBase64,
          fit: fit,
          errorBuilder: (_, obj, trace) {
            onError?.call(obj, trace);
            return errorWidget();
          },
        );
      } else if (initializer(char: 6) == 'assets') {
        image = Image.asset(
          stringBase64,
          fit: fit,
          errorBuilder: (_, obj, trace) {
            onError?.call(obj, trace);
            return errorWidget();
          },
        );
      } else {
        image = Image.file(
          File(stringBase64),
          fit: fit,
          errorBuilder: (_, obj, trace) {
            onError?.call(obj, trace);
            return errorWidget();
          },
        );
      }
    }

    return bytes != null
        ? Image.memory(
            bytes,
            height: height,
            width: width,
            fit: fit,
            color: color,
            alignment: alignment ?? Alignment.center,
            colorBlendMode: colorBlendMode,
          )
        : box(child: onErrorWidget ?? image ?? svgImage);
  }

  /* ***
   * Decode Base 64 Images as "Uint8List"
   * Have to view in "Image.memory()" Widget
   * **/

  static Uint8List getFromBase64(
    String stringBase64, {
    String filterOutBefore = '',
    String filterOutAfter = '',
  }) {
    late Uint8List bytes;
    if (filterOutBefore.isNotEmpty || filterOutAfter.isNotEmpty) {
      bytes = base64.decode(stringBase64.toSubstring(fromStart: filterOutBefore.length, fromEnd: filterOutAfter.length));
    } else {
      bytes = base64.decode(stringBase64.split(';base64,').last);
    }
    return bytes;
  }

  static String getStatus(dynamic item) {
    if (item != null) {
      return item.map((e) => e is String ? e : e["name"]).toList().join(", ").toString();
    } else {
      return '-';
    }
  }

  static copyText(String text) async {
    ClipboardData? data = await Clipboard.getData('text/plain');
    var copiedText = data?.text;
    if (copiedText?.trim() == text.trim()) {
      return;
    } else {
      Clipboard.setData(ClipboardData(text: text)).then((_) {
        Get.rawSnackbar(
            messageText: AppText.bodyExtraSmall("Copied", textAlign: TextAlign.center, color: AppColor.dark202125),
            padding: const EdgeInsets.all(5),
            backgroundColor: Colors.grey.withOpacity(0.2),
            animationDuration: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 1000));
      });
    }
  }

  static dynamic getCopyText() async {
    ClipboardData? data = await Clipboard.getData('text/plain');
    var text = data?.text;
    return text;
  }

  static List<LinearGradient> gradientsColor = const [
    LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ],
    ),
    LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFFff00ea),
        Color(0xFFff7300),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      transform: GradientRotation(-135),
      colors: [
        Color.fromRGBO(72, 229, 169, 1),
        Color.fromRGBO(143, 199, 173, 1),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(116, 167, 126, 1),
        Color.fromRGBO(24, 175, 78, 1),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFff7f11),
        Color(0xFFff7f11),
      ],
    ),
    LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      transform: GradientRotation(90),
      colors: [
        Color(0xFF00ffe1),
        Color(0xFFe9ff42),
      ],
    )
  ];

  static List<String> feedBackGroundGradientColors = [
    "{\"backgroundImage\":\"linear-gradient(45deg, rgb(255, 115, 0) 0%, rgb(255, 0, 234) 100%)\"}",
    "{\"backgroundImage\":\"linear-gradient(135deg, rgb(143, 199, 173), rgb(72, 229, 169))\"}",
    "{\"backgroundImage\":\"linear-gradient(135deg, rgb(116, 167, 126), rgb(24, 175, 78))\"}",
    "{\"backgroundImage\":\"linear-gradient(45deg, rgb(255, 127, 17) 0%, rgb(255, 127, 17) 100%)\"}",
    "{\"backgroundImage\":\"linear-gradient(45deg, rgb(233, 255, 66) 0%, rgb(0, 255, 225) 100%)\"}"
  ];


}
