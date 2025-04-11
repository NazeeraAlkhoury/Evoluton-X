import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomResultRow extends StatelessWidget {
  final ResultModel resultModel;
  final bool isResult;
  const CustomResultRow({
    super.key,
    required this.resultModel,
    required this.isResult,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(resultModel.icon,
              color:
                  isResult ? const Color(0xffe7feff) : AppColors.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(resultModel.title,
                style: AppTextStyles.styleRegular16(context).copyWith(
                  color:
                      isResult ? const Color(0xffe7feff) : AppColors.blackColor,
                )),
          ),
          Text(
            resultModel.value,
            style: AppTextStyles.styleSemiBold16(context).copyWith(
              color: isResult ? const Color(0xffe7feff) : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ResultModel extends Equatable {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const ResultModel({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  List<Object?> get props => [
        icon,
        title,
        value,
        color,
      ];
}
