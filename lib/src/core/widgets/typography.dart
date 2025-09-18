import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/theme/app_style_text.dart';

class TextStyleV1 {
  TextStyleV1._();

  static final h1 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    // height: 1.275,
  ).lineHeight(60.sp);

  static final h2 = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w600,
    // height: 1.35,
  ).lineHeight(52.sp);

  static final body1 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    // height: 1.4,
  ).lineHeight(30.sp);

  static final body2 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    // height: 1.4,
  ).lineHeight(27.sp);

  static final body3 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    // height: 1.25,
  ).lineHeight(24.sp);
}

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.letterSpacing,
    this.style,
    this.textAlign,
    this.height,
    this.fontSize,
    this.color = Colors.black,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.weight,
    this.fontStyle = FontStyle.normal,
  });

  final String data;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final FontStyle fontStyle;
  final FontWeight? weight;

  AppText.h1(
    this.data, {
    super.key,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
    this.weight,
  }) : style = TextStyleV1.h1;

  AppText.h2(
    this.data, {
    super.key,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
    this.weight,
  }) : style = TextStyleV1.h2;

  AppText.body1(
    this.data, {
    super.key,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
    this.weight,
  }) : style = TextStyleV1.body1;

  AppText.body2(
    this.data, {
    super.key,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
    this.weight,
  }) : style = TextStyleV1.body2;

  AppText.body3(
    this.data, {
    super.key,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
    this.weight,
  }) : style = TextStyleV1.body3;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: style?.copyWith(
        fontWeight: weight,
        fontStyle: fontStyle,
        height: height,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
