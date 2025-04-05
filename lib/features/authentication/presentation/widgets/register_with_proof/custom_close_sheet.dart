import 'package:evoluton_x/core/utils/app_colors.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCloseSheet extends StatelessWidget {
  const CustomCloseSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: GestureDetector(
        onTap: () {
          context.read<RegisterBloc>().add(ResetRegisterEvent());
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.cancel_outlined,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
