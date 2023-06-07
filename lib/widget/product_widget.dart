import 'package:ebnsina/screens/product_detail_screen.dart';
import 'package:ebnsina/widget/rating.dart';
import 'package:flutter/material.dart';

import '../utils/color_resources.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import 'wish_button.dart';

class ProductWidget extends StatelessWidget {
  final String title, image;
  ProductWidget({super.key, required this.title, required this.image});

  final oneSideShadow = Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
    child: Container(
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: ColorResources.Black_COLOR.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _productGridView(context);
  }

  InkWell _productGridView(
    BuildContext context,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_TEN),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorResources.getCardBgColor(context),
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_TEN),
            boxShadow: [
              BoxShadow(
                color: ColorResources.Black_COLOR.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 7,
                spreadRadius: 0.1,
              ),
            ]),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      oneSideShadow,
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorResources.getCardBgColor(context),
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(Dimensions.RADIUS_SIZE_TEN),
                            topRight:
                                Radius.circular(Dimensions.RADIUS_SIZE_TEN),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(Dimensions.RADIUS_SIZE_TEN),
                            topRight:
                                Radius.circular(Dimensions.RADIUS_SIZE_TEN),
                          ),
                          child: Image.network(
                            image,
                            height: 155,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          title,
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.FONT_SIZE_LARGE),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: RatingBar(rating: 2.0, size: 10),
                      ),
                      Text(
                        "1 3",
                        style: poppinsRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Text(
                      //   PriceConverter.convertPrice(context, priceWithDiscount),
                      //   style: poppinsBold.copyWith(
                      //       fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                      // ),
                      // product.price! > priceWithDiscount
                      //     ? Text(
                      //         '${PriceConverter.convertPrice(context, product.price)}',
                      //         style: poppinsRegular.copyWith(
                      //           fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                      //           color: ColorResources.RED_COLOR,
                      //           decoration: TextDecoration.lineThrough,
                      //         ),
                      //       )
                      //     : SizedBox(),

                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailsScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add to cart",
                                  style: poppinsRegular.copyWith(
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                      color: Theme.of(context).primaryColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                    width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset(Images.shopping_cart_bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned.fill(
                child: Align(
              alignment: Alignment.topRight,
              child: WishButton(
                edgeInset: EdgeInsets.all(8.0),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
