import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/styles.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final Function? onTap;
  const TitleWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: EdgeInsets.zero,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title!, style: poppinsMedium),
        onTap != null
            ? InkWell(
                onTap: onTap as void Function()?,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Text(
                    "View all",
                    style: poppinsRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: Theme.of(context).primaryColor.withOpacity(0.8)),
                  ),
                ),
              )
            : SizedBox(),
      ]),
    );
  }
}
