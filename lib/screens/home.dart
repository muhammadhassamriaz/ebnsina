import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../widget/banner_view.dart';
import '../widget/category.dart';
import '../widget/flash_deals.dart';
import '../widget/title_row.dart';
import '../widget/title_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          BannersView(),

          // Category
          CategoryView(),

          // Category
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

          // TitleRow(
          //   isDetailsPage: false,
          //   title: "Flash Deal",
          //   eventDuration: null,
          //   // onTap: () => Navigator.pushNamed(context,
          //   //     RouteHelper.getHomeItemRoute(ProductType.FLASH_SALE)),
          // ),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          FlashDealsView(isHomeScreen: true),
        ]),
      ),
    );
  }
}
