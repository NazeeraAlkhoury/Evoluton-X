import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLeadingAppbar extends StatelessWidget {
  const CustomLeadingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Text(
            'zak marbilon',
            style: AppTextStyles.styleSemiBold16(context).copyWith(
              fontStyle: FontStyle.italic,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 21,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.14),
              color: const Color(0xffE0E0E0),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Transform.rotate(
                  angle: -1.5708,
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 15,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
