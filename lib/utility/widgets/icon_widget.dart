// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ticketing_app/constants/app_colors.dart';

// import '../utils/app_utils/app_utils.dart';

// class IconWidget extends StatefulWidget {
//   const IconWidget({
//     super.key,
//     required this.data,
//     this.width,
//     this.height,
//     this.color,
//     this.onClick,
//     this.leftPadding,
//     this.rightPadding,
//   });
//   final String data;
//   final double? width;
//   final double? height;
//   final Color? color;
//   final Function? onClick;
//   final double? leftPadding;
//   final double? rightPadding;

//   @override
//   State<IconWidget> createState() => _IconWidgetState();
// }

// class _IconWidgetState extends State<IconWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.onClick != null
//         ? InkWell(
//             hoverColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
//               widget.onClick!();
//             },
//             child: _iconWidget(),
//           )
//         : _iconWidget();
//   }

//   _iconWidget() {
//     return Container(
//       width: widget.width?.h ?? 18,
//       height: widget.height?.w ?? 18,
//       alignment: Alignment.center,
//       margin: EdgeInsets.only(
//           left: widget.leftPadding ?? 0, right: widget.rightPadding ?? 0),
//       child: SvgPicture.asset(
//         fetchIconFromAsset(widget.data),
//         width: widget.width,
//         height: widget.height,
//         color: widget.color ?? AppColors.whiteColor,
//       ),
//     );
//   }
// }
