import 'package:ebnsina/provider/theme_provider.dart';
import 'package:ebnsina/screens/main_screen.dart';
import 'package:ebnsina/utils/globals.dart';
import 'package:ebnsina/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/dimensions.dart';

class AppCustomDrawer extends StatelessWidget {
  final List<MainScreenModel> listTile;

  const AppCustomDrawer({super.key, required this.listTile});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      surfaceTintColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0) +
            const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                sizedBoxWidth2,
                Text(
                  "Guest",
                  style: poppinsMedium.copyWith(
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            ),
            sizedBoxHeight1,
            const Divider(
              color: Colors.white54,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listTile.length,
                itemBuilder: (ctx, i) {
                  return Consumer<ThemeProvider>(builder: (c, splash, _) {
                    return ListTile(
                      onTap: () {
                        if (splash.pageIndex != 0) {
                          splash.setPageIndex(0);
                        } else {
                          splash.setPageIndex(i);
                        }
                        Navigator.pop(context);
                      },
                      leading: Image.asset(
                        listTile[i].icon,
                        width: 20,
                        height: 20,
                      ),
                      title: Text(
                        listTile[i].title,
                        style: poppinsMedium.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: Colors.white,
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
