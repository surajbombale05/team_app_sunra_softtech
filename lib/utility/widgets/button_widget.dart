import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/widgets/circular_progress_indicator_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onClick,
      required this.text,
      this.borderRadius = 5,
      this.width = 100,
      this.height = 45,
      this.isInProgress = false,
      this.isDark = false,
      this.isTransparentColor = false,
      this.showShadow = false,
      this.isBorder = false,
      this.textStyle,
      this.fontSize = 14,
      this.fontWeight,
      this.textColor = AppColors.blackColor,
      this.borderColor,
      this.backgroundColor,
      this.showIcon = false,
      this.isSuffixIcon = false,
      this.isPrefixIcon = false,
      this.iconName,
      this.iconColor,
      this.iconHeight,
      this.iconWidth,
      this.rightPaddingToIcon,
      this.distanceBetweenIconAndText});

  final Function onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final bool isInProgress;
  final bool isDark;
  final bool isTransparentColor;
  final bool showShadow;
  final bool isBorder;
  final TextStyle? textStyle;
  final bool showIcon;
  final bool isSuffixIcon;
  final String? iconName;
  final Color? iconColor;
  final double? iconHeight;
  final double? iconWidth;
  final bool? isPrefixIcon;
  final double? rightPaddingToIcon;
  final double? distanceBetweenIconAndText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(
        borderRadius,
      )),
      onTap: () {
        if (!isInProgress) {
          onClick();
        }
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          color: isDark
              ? Theme.of(context).primaryColor
              : isTransparentColor
                  ? Colors.transparent
                  : backgroundColor ?? AppColors.whiteColor,
          border: isBorder
              ? Border.all(
                  color: borderColor ?? Theme.of(context).primaryColor,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: showShadow
                  ? Theme.of(context).shadowColor
                  : Colors.transparent,
              blurRadius: 20,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: isInProgress
            ? CircularProgressIndidatorWidget(
                // context: context,
                size: 20,
                color: isDark
                    ? AppColors.whiteColor
                    : textColor ?? Theme.of(context).primaryColor,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // isPrefixIcon == true
                  //     ? Padding(
                  //         padding: EdgeInsets.only(right: 8.0.w),
                  //         child: IconWidget(
                  //           data: iconName ?? "",
                  //           color: iconColor,
                  //           height: iconHeight ?? 18.h,
                  //           width: iconWidth ?? 18.w
                  //         ),
                  //       )
                  //     : const SizedBoxWidget(
                  //         height: 1,
                  //         width: 1,
                  //       ),
                  Padding(
                    padding:const 
                        EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    child: TextWidget(
                      text: text,
                      textAlign: TextAlign.center,
                      color: isDark
                          ? AppColors.whiteColor
                          : textColor ?? Theme.of(context).primaryColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                  SizedBoxWidget(
                    width: distanceBetweenIconAndText ?? 2,
                  ),
                  // isSuffixIcon == true
                  //     ? Padding(
                  //         padding: EdgeInsets.only(
                  //             right: rightPaddingToIcon ?? 0.0.w),
                  //         child: IconWidget(
                  //           data: iconName ?? "",
                  //           color: iconColor,
                  //           height: iconHeight ?? 18.h,
                  //           width: iconWidth ?? 18.w
                  //         ),
                  //       )
                  //     : const SizedBoxWidget(
                  //         height: 1,
                  //         width: 1,
                  //       ),
                ],
              ),
      ),
    );
  }
}
