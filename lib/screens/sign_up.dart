import 'package:ebnsina/screens/login.dart';
import 'package:flutter/material.dart';

import '../utils/color_resources.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import '../widget/button.dart';
import '../widget/custom_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? _emailController;
  final FocusNode _emailFocus = FocusNode();
  bool email = true;
  bool phone = false;
  String? _countryDialCode = '+880';
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: size.width > 700 ? 700 : size.width,
                        padding: size.width > 700
                            ? EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT)
                            : null,
                        decoration: size.width > 700
                            ? BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300]!,
                                      blurRadius: 5,
                                      spreadRadius: 1)
                                ],
                              )
                            : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 30),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  Images.appLogo,
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                                child: Text(
                              "Sign Up",
                              style: poppinsMedium.copyWith(
                                  fontSize: 24,
                                  color: ColorResources.getTextColor(context)),
                            )),
                            SizedBox(height: 35),
                            Text(
                              "Email",
                              style: poppinsRegular.copyWith(
                                  color: ColorResources.getHintColor(context)),
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: "JohnDoe@gmail.com",
                              isShowBorder: true,
                              inputAction: TextInputAction.done,
                              inputType: TextInputType.emailAddress,
                              controller: _emailController,
                              focusNode: _emailFocus,
                            ),

                            SizedBox(height: 6),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.PADDING_SIZE_LARGE),
                                child: Divider(height: 1)),

                            // for continue button
                            SizedBox(height: 12),
                            CustomButton(
                              buttonText: "Continue",
                              onPressed: () {},
                            ),
                            // for create an account
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()),
                                    (route) => false);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have account?",
                                      style: poppinsRegular.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                          color: ColorResources.getHintColor(
                                              context)),
                                    ),
                                    SizedBox(
                                        width: Dimensions.PADDING_SIZE_SMALL),
                                    Text(
                                      "Login",
                                      style: poppinsMedium.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                          color: ColorResources.getTextColor(
                                              context)),
                                    ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
