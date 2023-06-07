import 'package:ebnsina/screens/checkout_screen.dart';
import 'package:ebnsina/utils/globals.dart';
import 'package:ebnsina/widget/button.dart';
import 'package:ebnsina/widget/custom_divider.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import '../widget/delivery_options.dart';

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({super.key});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight1,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0) +
                          const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                      child: Row(
                        children: [
                          Image.network(
                            "https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol/en_pk/pakistan_product/panadol-regular/408x300-panadol-regular.png?auto=format",
                            height: 80,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          sizedBoxWidth1,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Panadol",
                                  style: poppinsMedium.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "100.0 pc",
                                  style: poppinsMedium.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Variation: 50mg - 100mg",
                                  style: poppinsMedium.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "400.0\$",
                            style: poppinsMedium.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10),
                    left: Radius.circular(10),
                  ),
                  elevation: 10,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        style: poppinsMedium,
                        decoration: InputDecoration(
                          hintText: "Enter Promo Code",
                          hintStyle: poppinsRegular.copyWith(
                              color: Theme.of(context).hintColor),
                          isDense: true,
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10),
                              left: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Apply",
                            style: poppinsMedium.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxHeight1,
                const Divider(),
                sizedBoxHeight2,
                Text("Delivery Option",
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE)),
                DeliveryOptionButton(
                  value: 'delivery',
                  title: "Delivery",
                ),
                DeliveryOptionButton(
                  value: 'self_pickup',
                  title: "Self Pick",
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Row(
                  children: [
                    Text(
                      "Item Price",
                      style: poppinsRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "400.00 \$",
                      style: poppinsRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Vat/Tax",
                      style: poppinsRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "(+) 0.00 \$",
                      style: poppinsRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Discount",
                      style: poppinsRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "(-) 0.00 \$",
                      style: poppinsRegular.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight2,
                const CustomDivider(),
                sizedBoxHeight2,
                Row(
                  children: [
                    Text(
                      "Subtotal",
                      style: poppinsMedium.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "400.00 \$",
                      style: poppinsMedium.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                // Spacer(),
                sizedBoxHeight2,
                sizedBoxHeight2,

                CustomButton(
                  buttonText: "Continue Checkout",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CheckoutScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
