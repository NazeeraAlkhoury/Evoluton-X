import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String prefixIcon;
  final bool? isObscureText;
  final String? suffixIcon;
  final void Function()? onSuffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool isColorFilter;
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isObscureText = false,
    this.suffixIcon,
    this.onSuffix,
    this.keyboardType,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.isColorFilter = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyles.styleRegular14(context),
      obscureText: isObscureText!,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            prefixIcon,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onSuffix,
                icon: SvgPicture.asset(suffixIcon!),
              )
            : null,
        hintText: hintText,
        hintStyle: AppTextStyles.styleRegular14(context)
            .copyWith(color: AppColors.texthintColor),
        filled: true,
        fillColor: AppColors.fillFieldColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        errorStyle: AppTextStyles.styleRegular12(context).copyWith(
          color: AppColors.redColor,
          overflow: TextOverflow.ellipsis,
        ),
        errorMaxLines: 2,
        border: getBorderStyle(),
        enabledBorder: getBorderStyle(),
        focusedBorder: getBorderStyle(),
        errorBorder: getBorderStyle(
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: getBorderStyle(
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction ?? TextInputAction.next,
    );
  }

  OutlineInputBorder getBorderStyle({BorderSide? borderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: borderSide ?? BorderSide.none,
    );
  }
}
