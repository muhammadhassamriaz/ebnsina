// import 'package:flutter/material.dart';

// import '../utils/dimensions.dart';

// class HomeItemView extends StatelessWidget {
//   const HomeItemView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SizedBox(
//         height: 290,
//         child: ListView.builder(
//           padding:
//               EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
//           itemCount: 5,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Container(
//               width: 195,
//               padding: EdgeInsets.all(5),
//               child: ProductWidget(
//                 isGrid: true,
//                 product: productList![index],
//                 productType: ProductType.DAILY_ITEM,
//               ),
//             );
//           },
//         ),
//       ),
//     ]);
//   }
// }
