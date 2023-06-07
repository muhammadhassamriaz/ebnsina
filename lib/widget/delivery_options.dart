import 'package:ebnsina/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/dimensions.dart';
import '../utils/styles.dart';

class DeliveryOptionButton extends StatelessWidget {
  final String value;
  final String? title;
  final bool freeDelivery;
  DeliveryOptionButton(
      {required this.value, required this.title, this.freeDelivery = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, order, child) {
        return InkWell(
          onTap: () => order.setOrderType(value),
          child: Row(
            children: [
              Radio(
                value: value,
                groupValue: order.orderType,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (String? value) => order.setOrderType(value),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Text(title!, style: poppinsRegular),
              SizedBox(width: 5),
              Text('', style: poppinsMedium)
            ],
          ),
        );
      },
    );
  }
}
