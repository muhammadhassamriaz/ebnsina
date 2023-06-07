import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../screens/main_screen.dart';
import '../utils/color_resources.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import 'custom_drawer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();
  final CustomDrawerController _drawerConrtroller = CustomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuWidget(
        drawerController: _drawerConrtroller,
        drawer: _drawerController,
      ),
      showShadow: false,
      angle: 0.0,
      borderRadius: 30,
      slideWidth: MediaQuery.of(context).size.width * (0.70),
      mainScreen: MainScreen(),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final CustomDrawerController? drawerController;
  final ZoomDrawerController? drawer;

  MenuWidget({this.drawerController, this.drawer});

  @override
  Widget build(BuildContext context) {
    // final _screenList = screenList;

    return WillPopScope(
      onWillPop: () async {
        // if (drawerController!.isOpen()) {
        // drawerController!.toggle();
        drawer!.toggle?.call();

        return false;
        // } else {
        //   return true;
        // }
      },
      child: Scaffold(
        backgroundColor: ColorResources.getBackgroundColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 1170,
                child: Consumer<ThemeProvider>(
                  builder: (context, splash, child) {
                    return Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              onTap: () {},
                              leading: ClipOval(
                                child: Image.asset(Images.placeholder(context),
                                    height: 50, width: 50, fit: BoxFit.cover),
                              ),
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Guest",
                                      style: poppinsRegular.copyWith(
                                        color:
                                            ColorResources.getBackgroundColor(
                                                context),
                                      ),
                                    ),
                                    Text(
                                      '0123456789',
                                      style: poppinsRegular.copyWith(
                                        color:
                                            ColorResources.getBackgroundColor(
                                                context),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications,
                                color:
                                    ColorResources.getBackgroundColor(context)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          Images.appLogo,
                          color: Colors.white,
                          width: 25,
                          height: 25,
                        ),
                        title: Text(
                          "Log In",
                          style: poppinsRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: ColorResources.getBackgroundColor(context),
                          ),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton {
  final String routeName;
  final String icon;
  final String title;
  final IconData? iconData;
  MenuButton(
      {required this.routeName,
      required this.icon,
      required this.title,
      this.iconData = null});
}
