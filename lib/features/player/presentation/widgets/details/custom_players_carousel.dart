import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomPlayersCarousel extends StatelessWidget {
  final Function(int index, CarouselPageChangedReason reason) onChanged;
  final List<String> imageUrl;
  const CustomPlayersCarousel({
    super.key,
    required this.onChanged,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        reverse: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: onChanged,
      ),
      items: List.generate(
          3,
          (index) => CachedNetworkImage(
                imageUrl: imageUrl[index],
                width: double.infinity,
                fit: BoxFit.cover,
              )),
    );
  }
}
