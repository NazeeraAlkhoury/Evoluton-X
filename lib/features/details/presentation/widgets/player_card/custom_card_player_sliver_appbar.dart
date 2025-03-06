import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class CustomCardPlayerSliverAppBar extends StatelessWidget {
  const CustomCardPlayerSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 80,
              ),
              Text(
                'Player Name',
                style: AppTextStyles.styleSemiBold20(context),
              ),
              const SizedBox(
                width: 50,
              ),
              CircleAvatar(
                radius: 10,
                child: Image.asset(
                  'assets/images/flag.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 10,
                child: Image.asset(
                  'assets/images/flag.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        centerTitle: true,
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Image.asset(
            'assets/images/slider_image.png',
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
          ),
        ),
      ),
      elevation: 0,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CustomBackButton(
            onTap: () {},
          ),
        ),
      ),
      // leadingWidth: 100,
    );
  }
}
