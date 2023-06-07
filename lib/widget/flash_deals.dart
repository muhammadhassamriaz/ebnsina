import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebnsina/widget/product_widget.dart';
import 'package:ebnsina/widget/rating.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';

class FlashDealsView extends StatelessWidget {
  final bool isHomeScreen;
  FlashDealsView({this.isHomeScreen = true});

  final List<String> medicines = [
    "Dispirin",
    "Panadol",
    "Regix",
    "Paracetamol",
    "Ponstan"
  ];
  final List<String> images = [
    "https://nuskha.com.au/wp-content/uploads/2022/06/13d02a8f8f522689cad493524dd654bfa7f3385d.jpg",
    "https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol/en_pk/pakistan_product/panadol-regular/408x300-panadol-regular.png?auto=format",
    "https://agp.com.pk/wp-content/uploads/images/Rigix%20tab.%20-%203D.jpg",
    "https://assets.sainsburys-groceries.co.uk/gol/8075006/1/640x640.jpg",
    "https://medicalstore.com.pk/wp-content/uploads/2020/05/121ponstan-250-600tablets.png"
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 2.0,
          crossAxisCount: 1),
      itemCount: images.length,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL,
          vertical: Dimensions.PADDING_SIZE_LARGE),
      // padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_DEFAULT),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ProductWidget(
          title: medicines[index],
          image:
              "https://www.prettyhealthy.sg/wp-content/uploads/2021/01/8888008120362_1.jpg",
        );
      },
    );
  }
}
