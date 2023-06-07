import 'package:ebnsina/screens/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/color_resources.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';

const List<String> subCategories = [
  "All",
  "Headache",
  "Migraine",
];

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  int selectedIndex = 0;
  List tabletcategories = [
    "Chewable",
    "Oral",
    "Sublingual",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          margin: EdgeInsets.only(top: 3),
          height: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[
                      Provider.of<ThemeProvider>(context).darkTheme
                          ? 900
                          : 200]!,
                  spreadRadius: 3,
                  blurRadius: 10)
            ],
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: tabletcategories.length,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 110,
                    margin: EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                        horizontal: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: selectedIndex == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              //padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedIndex == index
                                      ? ColorResources.getCategoryBgColor(
                                          context)
                                      : ColorResources.getGreyLightColor(
                                              context)
                                          .withOpacity(0.05)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                      "https://i0.wp.com/cdn0.woolworths.media/content/wowproductimages/large/032006.jpg?resize=1200&w=1200")),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              child: Text(tabletcategories[index]!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: poppinsSemiBold.copyWith(
                                      fontSize:
                                          Dimensions.FONT_SIZE_EXTRA_SMALL,
                                      color: selectedIndex == index
                                          ? ColorResources.getBackgroundColor(
                                              context)
                                          : ColorResources.getTextColor(
                                              context))),
                            ),
                          ]),
                    ),
                  ));
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: subCategories.length,
            itemBuilder: (c, i) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SubCategories(
                        title: subCategories[i],
                      ),
                    ),
                  );
                },
                leading: Text(
                  subCategories[i],
                  style: poppinsRegular.copyWith(
                    fontSize: 12,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
