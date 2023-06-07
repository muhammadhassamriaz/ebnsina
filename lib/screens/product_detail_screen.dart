import 'package:ebnsina/widget/rating.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  final bool? fromSearch;
  ProductDetailsScreen({this.fromSearch = false});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  int selectIndex = 0;
  List<String> sizes = ["25mg", "50mg", "100mg"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 200,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        Images.image3,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Aspirin",
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
              Row(
                children: [
                  RatingBar(
                    rating: 3.5,
                    size: 10,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("400.00 \$ - 900.00 \$"),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "In Stock",
                        style: poppinsRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                "Quantity",
                style: poppinsRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: List.generate(
                  sizes.length,
                  (index) => GestureDetector(
                    onTap: () {
                      selectIndex == index;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectIndex == index
                                ? Theme.of(context).primaryColor
                                : null,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            sizes[index],
                            style: poppinsRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.bold,
                              color: selectIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Total Amount",
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "400.00\$",
                    style: poppinsRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TabBar(
                tabs: [
                  Text("Description"),
                  Text("Review"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "A drug that reduces pain, fever, inflammation, and blood clotting. Aspirin belongs to the family of drugs called nonsteroidal anti-inflammatory agents. It is also being studied in cancer prevention.",
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "3.0",
                            style: poppinsRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_MAX_LARGE,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          RatingBar(
                            rating: 3.0,
                          ),
                          Text(
                            "2 Reviews",
                            style: poppinsRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: Colors.orange,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Excelent",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Good",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Average",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Below\nAverage",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Poor",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.grey[200],
                                          ),
                                        ),
                                        Container(
                                          height: 10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[200]),
                                        height: 30,
                                        width: 30,
                                        child: Icon(Icons.person),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("New Test User"),
                                      Spacer(),
                                      RatingBar(
                                        rating: 3.5,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Nice product"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[200]),
                                        height: 30,
                                        width: 30,
                                        child: Icon(Icons.person),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Fatema Subarna"),
                                      Spacer(),
                                      RatingBar(
                                        rating: 3.5,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Ok"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
