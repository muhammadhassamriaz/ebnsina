import 'dart:collection';
import 'dart:ui';

import 'package:ebnsina/provider/theme_provider.dart';
import 'package:ebnsina/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../utils/color_resources.dart';
import '../utils/date_converter.dart';
import '../utils/dimensions.dart';
import '../utils/globals.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import '../widget/button.dart';
import '../widget/custom_divider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  late GoogleMapController _mapController;
  // List<Branches>? _branches = [];
  final List<String> branches = ["Main", "Second Branch", "Third Branch"];
  int selectedIndex = 0;
  bool _loading = true;
  Set<Marker> _markers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: poppinsMedium.copyWith(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: Theme.of(context).primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: SizedBox(
                      width: 1170,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                child: Column(children: [
                                  //Branch
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Text(
                                            "Select Branch",
                                            style: poppinsMedium.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            padding: const EdgeInsets.all(
                                                Dimensions.PADDING_SIZE_SMALL),
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: branches.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: Dimensions
                                                        .PADDING_SIZE_SMALL),
                                                child: InkWell(
                                                  onTap: () {
                                                    selectedIndex = index;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: Dimensions
                                                            .PADDING_SIZE_EXTRA_SMALL,
                                                        horizontal: Dimensions
                                                            .PADDING_SIZE_SMALL),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: index ==
                                                              selectedIndex
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                          : ColorResources
                                                              .getBackgroundColor(
                                                                  context),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(branches[index],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: poppinsMedium
                                                            .copyWith(
                                                          color: index ==
                                                                  selectedIndex
                                                              ? Colors.white
                                                              : Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .color,
                                                        )),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          height: 200,
                                          padding: const EdgeInsets.all(
                                              Dimensions.PADDING_SIZE_SMALL),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: Dimensions
                                                  .PADDING_SIZE_SMALL),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Theme.of(context).cardColor,
                                          ),
                                          child: Stack(children: [
                                            GoogleMap(
                                              minMaxZoomPreference:
                                                  const MinMaxZoomPreference(
                                                      0, 16),
                                              mapType: MapType.normal,
                                              initialCameraPosition:
                                                  const CameraPosition(
                                                      target: LatLng(
                                                        31.582045,
                                                        74.329376,
                                                      ),
                                                      zoom: 8),
                                              zoomControlsEnabled: true,
                                              markers: _markers,
                                              onMapCreated: (GoogleMapController
                                                  controller) async {
                                                await Geolocator
                                                    .requestPermission();
                                                _mapController = controller;
                                                _loading = false;
                                                _setMarkers(0);
                                              },
                                            ),
                                            _loading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Theme.of(context)
                                                                .primaryColor),
                                                  ))
                                                : const SizedBox(),
                                          ]),
                                        ),
                                      ]),
                                  // Time Slot
                                  Align(
                                    alignment: Provider.of<ThemeProvider>(
                                                context,
                                                listen: false)
                                            .isLtr
                                        ? Alignment.topLeft
                                        : Alignment.topRight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: Dimensions
                                                  .PADDING_SIZE_SMALL),
                                          child: Text("Preference Time",
                                              style: poppinsMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_LARGE)),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          height: 52,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18,
                                                    bottom: 2,
                                                    top: 2),
                                                child: InkWell(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 13,
                                                        horizontal: 20),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .getTimeColor(
                                                              context),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey[Provider.of<
                                                                            ThemeProvider>(
                                                                        context)
                                                                    .darkTheme
                                                                ? 800
                                                                : 100]!,
                                                            spreadRadius: .5,
                                                            blurRadius: .5)
                                                      ],
                                                    ),
                                                    child: Text(
                                                      index == 0
                                                          ? "Today"
                                                          : index == 1
                                                              ? "Tomorrow"
                                                              : DateConverter
                                                                  .estimatedDate(DateTime
                                                                          .now()
                                                                      .add(const Duration(
                                                                          days:
                                                                              2))),
                                                      style: poppinsRegular.copyWith(
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_LARGE,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: Dimensions
                                                        .PADDING_SIZE_DEFAULT),
                                                child: InkWell(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 13,
                                                        horizontal: 20),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: ColorResources
                                                          .getTimeColor(
                                                              context),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .grey[Provider.of<
                                                                          ThemeProvider>(
                                                                      context)
                                                                  .darkTheme
                                                              ? 800
                                                              : 100]!,
                                                          spreadRadius: .5,
                                                          blurRadius: .5,
                                                        )
                                                      ],
                                                    ),
                                                    child: Text(
                                                      '12:30 PM - 02:00 PM',
                                                      style: poppinsRegular
                                                          .copyWith(
                                                        fontSize: Dimensions
                                                            .FONT_SIZE_LARGE,
                                                        color: Colors.grey[500],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Subtotal",
                    style: poppinsMedium.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "400.00 \$",
                    style: poppinsMedium.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Delivery Fee",
                    style: poppinsRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "20.00 \$",
                    style: poppinsMedium.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              sizedBoxHeight2,
              const CustomDivider(),
              sizedBoxHeight2,
              Row(
                children: [
                  Text(
                    "Subtotal",
                    style: poppinsMedium.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "420.00 \$",
                    style: poppinsMedium.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              // Spacer(),
              sizedBoxHeight2,
              sizedBoxHeight2,

              CustomButton(
                  buttonText: "Place Order",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Your order has been placed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ));
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setPageIndex(0);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => MainScreen()),
                        (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _setMarkers(int selectedIndex) async {
    late BitmapDescriptor _bitmapDescriptorUnSelect;
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(25, 30)),
            Images.restaurant_marker)
        .then((_marker) {});
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(20, 20)),
            Images.unselected_restaurant_marker)
        .then((_marker) {
      _bitmapDescriptorUnSelect = _marker;
    });
    // Marker
    _markers = HashSet<Marker>();

    _markers.add(Marker(
      markerId: const MarkerId('branch_123123'),
      position: const LatLng(31.582045, 74.329376),
      infoWindow: const InfoWindow(title: "EbnSina"),
      icon: _bitmapDescriptorUnSelect,
    ));

    _mapController
        .animateCamera(CameraUpdate.newCameraPosition(const CameraPosition(
            target: LatLng(
              31.582045,
              74.329376,
            ),
            zoom: 12)));

    setState(() {});
  }

  Future<Uint8List> convertAssetToUnit8List(String imagePath,
      {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
