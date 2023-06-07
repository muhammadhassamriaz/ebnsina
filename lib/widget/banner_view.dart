import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../utils/dimensions.dart';
import '../utils/images.dart';

class BannersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.only(
            top: Dimensions.PADDING_SIZE_LARGE,
            bottom: Dimensions.PADDING_SIZE_SMALL),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                disableCenter: true,
                onPageChanged: (index, reason) {},
              ),
              itemCount: 4,
              itemBuilder: (context, index, _) {
                return InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://www.shutterstock.com/image-vector/pharmacy-banner-square-frame-flat-260nw-1252649752.jpg",
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
