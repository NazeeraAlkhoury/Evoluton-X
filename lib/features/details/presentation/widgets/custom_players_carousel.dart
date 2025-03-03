import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomPlayersCarousel extends StatelessWidget {
  const CustomPlayersCarousel({
    super.key,
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
        onPageChanged: (index, reason) {
          //  _currentIndex = index;
          // setState(() {
          //   _currentIndex = index;
          // });
        },
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
