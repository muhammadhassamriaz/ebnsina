import 'package:flutter/material.dart';

class WishButton extends StatelessWidget {
  final EdgeInsetsGeometry edgeInset;
  const WishButton({Key? key, this.edgeInset = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: edgeInset,
        child:
            Icon(Icons.favorite_border, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
