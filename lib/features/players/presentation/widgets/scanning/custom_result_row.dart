import 'package:equatable/equatable.dart';
import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomResultRow extends StatelessWidget {
  final ResultModel resultModel;
  const CustomResultRow({
    super.key,
    required this.resultModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(resultModel.icon, color: AppColors.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(resultModel.title,
                style: AppTextStyles.styleRegular16(context)),
          ),
          Text(
            resultModel.value,
            style: AppTextStyles.styleSemiBold16(context),
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

  const ResultModel(
      {required this.icon, required this.title, required this.value});

  @override
  List<Object?> get props => [
        icon,
        title,
        value,
      ];
}
