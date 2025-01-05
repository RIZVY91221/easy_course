import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({Key? key, required this.items, this.onSelect, this.padding}) : super(key: key);
  final List<String> items;
  final Function(String)? onSelect;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: PopupMenuButton<String>(
        color: AppColor.whiteFFFFFF,
        surfaceTintColor: AppColor.whiteFFFFFF,
        constraints: BoxConstraints.tightFor(height: items.length * 44),
        padding: padding ?? const EdgeInsets.all(8),
        offset: const Offset(-10, 30),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.whiteLightestGrayF8F8F8),
            borderRadius: const BorderRadius.all(Radius.circular(0.0))),
        onSelected: onSelect,
        clipBehavior: Clip.hardEdge,
        icon: Icon(
          Icons.more_vert,
          color: AppColor.darkLightest6C7576,
          size: 24,
        ),
        itemBuilder: (BuildContext context) {
          return items.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              padding: const EdgeInsets.only(bottom: AppPadding.p20, left: AppPadding.p20),
              child: AppText.bodyExtraSmall(choice, color: AppColor.dark202125),
            );
          }).toList();
        },
      ),
    );
  }
}
