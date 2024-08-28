import 'package:carousel_slider/carousel_slider.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:flutter/material.dart';

class CustomCarsoul extends StatelessWidget {
  const CustomCarsoul({super.key, required this.items, this.onPageChanged});
  final List<String> items;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: onPageChanged,
        height: ConfigSize.defaultSize! * 20,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeFactor: 0.3,
      ),
      items: items.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: ConfigSize.screenWidth!,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(i), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
