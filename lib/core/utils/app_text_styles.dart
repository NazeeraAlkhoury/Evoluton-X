import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle styleRegular9(BuildContext context) => TextStyle(
        color: AppColors.offWhiteColor,
        fontSize: getResponsiveFontSize(context, fontSize: 9.52),
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleRegular12(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleRegular14(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleRegular16(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleMedium12(BuildContext context) => TextStyle(
        color: AppColors.offWhiteColor,
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w500,
      );
  static TextStyle styleMedium15(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSemiBold10(BuildContext context) => TextStyle(
        color: AppColors.offWhiteColor,
        fontSize: getResponsiveFontSize(context, fontSize: 10.88),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleSemiBold16(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleSemiBold18(BuildContext context) => TextStyle(
        color: AppColors.darkGreyColor,
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleSemiBold20(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleBold9(BuildContext context) => TextStyle(
        color: AppColors.darkGreyColor,
        fontSize: getResponsiveFontSize(context, fontSize: 9.52),
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleBold12(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleBold22(BuildContext context) => TextStyle(
        color: AppColors.blackColor,
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleExtraBold26(BuildContext context) => TextStyle(
        // color: Colors.transparent,
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontWeight: FontWeight.w800,
      );

// Responsive fun
  static double getResponsiveFontSize(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);

    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = responsiveFontSize * .8;

    double upperLimit = responsiveFontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static getScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    if (width < 600) {
      return width / 400;
    } else if (width < 900 && width >= 600) {
      return width / 700;
    } else if (width >= 900) {
      return width / 1000;
    }
  }
}
