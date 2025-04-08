import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';
import 'package:evoluton_x/core/utils/app_constants.dart';
import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/players/presentation/widgets/pop_options_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLeadingAppbar extends StatelessWidget {
  const CustomLeadingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? name = getIt<CachServices>().getData(key: AppConstants.name);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Text(
            name ?? 'Account settings',
            style: AppTextStyles.styleSemiBold16(context).copyWith(
              fontStyle: FontStyle.italic,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const PopupOptionsButton(),
        ],
      ),
    );
  }
}
