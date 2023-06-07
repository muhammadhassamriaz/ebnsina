import 'package:ebnsina/screens/all_categories_screen.dart';
import 'package:ebnsina/screens/home.dart';
import 'package:ebnsina/screens/login.dart';
import 'package:ebnsina/screens/shopping_bag.dart';
import 'package:ebnsina/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/app_const.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import '../widget/app_drawer.dart';
import '../widget/custom_drawer.dart';

List<MainScreenModel> screenList = [
  MainScreenModel(HomeScreen(), 'Home', Images.home),
  MainScreenModel(const ShoppingBagScreen(), 'Shopping Bag', Images.order_bag),
  MainScreenModel(AllCategoriesScreen(), 'All Categories', Images.list),

  // MainScreenModel(CartScreen(), 'shopping_bag', Images.order_bag),
  // MainScreenModel(WishListScreen(), 'favourite', Images.favourite_icon),
  // MainScreenModel(MyOrderScreen(), 'my_order', Images.order_list),
  // MainScreenModel(AddressScreen(), 'address', Images.location),
  // MainScreenModel(CouponScreen(), 'coupon', Images.coupon),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, splash, child) {
        return WillPopScope(
          onWillPop: () async {
            if (splash.pageIndex != 0) {
              splash.setPageIndex(0);
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
            key: _scaffoldKey,
            drawer: AppCustomDrawer(
              listTile: screenList,
            ),
            appBar: AppBar(
              surfaceTintColor: Theme.of(context).primaryColor,
              // elevation: 10,
              leading: IconButton(
                  icon: Image.asset(Images.more_icon,
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30),
                  onPressed: () {
                    // widget.drawerController.toggle();
                    _scaffoldKey.currentState?.openDrawer();
                  }),
              title: splash.pageIndex == 0
                  ? Row(children: [
                      Image.asset(Images.appLogo, width: 135),
                      // const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      // Expanded(
                      //     child: Text(
                      //   AppConstants.APP_NAME,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: poppinsMedium.copyWith(
                      //       color: Theme.of(context).primaryColor),
                      // )),
                    ])
                  : Text(
                      screenList[splash.pageIndex].title,
                      style: poppinsMedium.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: Theme.of(context).primaryColor),
                    ),
              actions: splash.pageIndex == 0
                  ? [
                      IconButton(
                          icon: Stack(clipBehavior: Clip.none, children: [
                            Image.asset(Images.cart_icon,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                width: 25),
                            Positioned(
                              top: -7,
                              right: -2,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor),
                                child: Text("1",
                                    style: TextStyle(
                                        color: Theme.of(context).cardColor,
                                        fontSize: 10)),
                              ),
                            ),
                          ]),
                          onPressed: () {
                            // ResponsiveHelper.isMobilePhone()
                            //     ? splash.setPageIndex(2)
                            //     : Navigator.pushNamed(
                            //         context, RouteHelper.cart);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ShoppingBagScreen(),
                              ),
                            );
                          }),
                      IconButton(
                          icon: Icon(Icons.search,
                              size: 30,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color),
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, RouteHelper.searchProduct);
                          }),
                    ]
                  : splash.pageIndex == 1
                      ? [
                          Center(
                            child: Text('${1} items',
                                style: poppinsMedium.copyWith(
                                    color: Theme.of(context).primaryColor)),
                          ),
                          const SizedBox(width: 20)
                        ]
                      : null,
            ),
            body: screenList[splash.pageIndex].screen,
          ),
        );
      },
    );
  }
}

class MainScreenModel {
  final Widget screen;
  final String title;
  final String icon;
  MainScreenModel(this.screen, this.title, this.icon);
}
