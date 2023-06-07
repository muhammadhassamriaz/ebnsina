import 'package:ebnsina/utils/globals.dart';
import 'package:ebnsina/widget/rating.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class SubCategories extends StatelessWidget {
  final String title;

  const SubCategories({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: poppinsMedium.copyWith(
            fontSize: 14,
          ),
        ),
        surfaceTintColor: Theme.of(context).primaryColor,
        elevation: 10,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight1,
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (c, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    "https://assets.sainsburys-groceries.co.uk/gol/8075006/1/640x640.jpg",
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                              ),
                              sizedBoxWidth1,
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Paracetamol",
                                        style: poppinsMedium.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      RatingBar(
                                        rating: 4.5,
                                        size: 10,
                                      ),
                                      Text(
                                        "100 mg",
                                        style: poppinsMedium.copyWith(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "10.00\$",
                                        style: poppinsMedium.copyWith(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                  ),
                                  sizedBoxHeight1,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(2),
                                    child: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total Item",
                            style: poppinsMedium.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "1 Item",
                            style: poppinsMedium.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: poppinsMedium.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "400.00 \$",
                            style: poppinsMedium.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
