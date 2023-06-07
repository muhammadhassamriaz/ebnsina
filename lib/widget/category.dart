import 'package:ebnsina/screens/sub_categories.dart';
import 'package:ebnsina/widget/title_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../provider/theme_provider.dart';
import '../utils/color_resources.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<String> categories = [
    "Equipment",
    "Pharmaceutical",
    "OTC",
  ];

  List<String> images = [
    "https://i.pinimg.com/originals/8d/2d/6f/8d2d6fdc071f813e5ae68f7f16499557.jpg",
    "https://www.oecd.org/media/oecdorg/directorates/directorateforemploymentlabourandsocialaffairs/health/Pharmaceuticals.jpg",
    "https://www.solvay.com/sites/g/files/srpend221/files/styles/header/https/media.solvay.com/medias/domain1446/media738/112969-c9mmuebxkq.jpg?itok=RzEclFO4"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
          child: TitleWidget(title: "Category"),
        ),
        GridView.builder(
          itemCount: images.length,
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (1 / 1.2),
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubCategories(title: categories[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(
                      Provider.of<ThemeProvider>(context).darkTheme ? 0.05 : 1),
                  boxShadow: Provider.of<ThemeProvider>(context).darkTheme
                      ? null
                      : [
                          BoxShadow(
                              color: Colors.grey[200]!,
                              spreadRadius: 1,
                              blurRadius: 5)
                        ],
                ),
                child: Column(children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                        margin:
                            EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.getCardBgColor(context),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding:
                          EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Text(
                        categories[index],
                        style: poppinsRegular.copyWith(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (1 / 1.2),
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(
                Provider.of<ThemeProvider>(context).darkTheme ? 0.05 : 1),
            boxShadow: Provider.of<ThemeProvider>(context).darkTheme
                ? null
                : [
                    BoxShadow(
                        color: Colors.grey[200]!,
                        spreadRadius: 1,
                        blurRadius: 5)
                  ],
          ),
          child: Shimmer(
            duration: Duration(seconds: 2),
            child: Column(children: [
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      vertical: Dimensions.PADDING_SIZE_LARGE),
                  child:
                      Container(color: Colors.grey[300], width: 50, height: 10),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
