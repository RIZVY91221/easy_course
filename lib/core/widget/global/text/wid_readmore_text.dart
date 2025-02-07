import 'package:bs_assignment/core/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetReadMoreText extends StatelessWidget {
  const WidgetReadMoreText({
    Key? key,
    required this.text,
    this.trimLines = 1,
    this.preDataTextStyle,
    this.textStyle,
    this.moreStyle,
    this.lessStyle,
    this.clickableTextColor,
    this.trimCollapsedText = 'More',
    this.trimExpandedText = ' Less',
  }) : super(key: key);

  final String text;
  final int trimLines;
  final TextStyle? preDataTextStyle;
  final TextStyle? textStyle;
  final TextStyle? moreStyle;
  final TextStyle? lessStyle;
  final Color? clickableTextColor;
  final String trimCollapsedText;
  final String trimExpandedText;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      preDataTextStyle: preDataTextStyle ?? Theme.of(context).textTheme.titleMedium,
      style: textStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.dark202125),
      moreStyle: moreStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
      lessStyle: lessStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
      colorClickableText: clickableTextColor ?? Theme.of(context).primaryColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: trimCollapsedText,
      trimExpandedText: trimExpandedText,
      textAlign: TextAlign.justify,
      annotations: [
        Annotation(
          regExp: RegExp(r'https?://[^\s]+'),
          spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
            text: text,
            style: textStyle?.copyWith(color: Colors.blue, decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () async {
              final url = text;
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
        ),
      ],
    );
  }
}
