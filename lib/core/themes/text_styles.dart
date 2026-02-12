import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';

class AppTextStyles {
  static TextStyle bigSize(BuildContext context, {FontWeight? fontWeigth}) =>
      context.textTheme.displaySmall?.copyWith(
        fontWeight: fontWeigth ?? FontWeight.bold,
        color: AppColors.primaryColor,
      ) ??
      const TextStyle();

  static TextStyle headingBigSize(
    BuildContext context, {
    FontWeight? fontWeigth,
  }) =>
      context.textTheme.titleLarge?.copyWith(
        fontWeight: fontWeigth ?? FontWeight.bold,
        color: AppColors.mainText,
      ) ??
      const TextStyle();

  static TextStyle headingSmallSize(BuildContext context) =>
      context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.mainText,
      ) ??
      const TextStyle();

  static TextStyle subHeading(BuildContext context) =>
      context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryText,
      ) ??
      const TextStyle();

  static TextStyle body(BuildContext context, {Color? color}) =>
      context.textTheme.titleSmall?.copyWith(
        color: color ?? AppColors.mainText,
      ) ??
      const TextStyle();
}
