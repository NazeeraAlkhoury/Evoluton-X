import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomPlayersCarousel extends StatelessWidget {
  final Function(int index, CarouselPageChangedReason reason) onChanged;
  const CustomPlayersCarousel({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        //  autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: onChanged,
      ),
      items: List.generate(
        3,
        (index) => Image.asset(
          'assets/images/slider_image.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
