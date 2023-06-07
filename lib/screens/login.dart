import 'package:ebnsina/provider/theme_provider.dart';
import 'package:ebnsina/screens/dashboard.dart';
import 'package:ebnsina/screens/home.dart';
import 'package:ebnsina/screens/main_screen.dart';
import 'package:ebnsina/screens/sign_up.dart';
import 'package:ebnsina/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:provider/provider.dart';

import '../utils/color_resources.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import '../widget/button.dart';
import '../widget/custom_drawer.dart';
import '../widget/custom_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _emailFocus = FocusNode();
  FocusNode _numberFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;
  bool email = true;
  bool phone = false;
  String? _countryDialCode;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  final CustomDrawerController _drawerController = CustomDrawerController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Center(
                child: Container(
              width: _width > 700 ? 700 : _width,
              padding: _width > 700
                  ? EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT)
                  : null,
              decoration: _width > 700
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          Images.appLogo,
                          height: MediaQuery.of(context).size.height / 4.5,
                          fit: BoxFit.scaleDown,
                        ),
                      )),
                      //SizedBox(height: 20),

                      Center(
                          child: Text(
                        "Login",
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
                        focusNode: _emailFocus,
                        nextFocus: _passwordFocus,
                        controller: _emailController,
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Text(
                        "Password",
                        style: poppinsRegular.copyWith(
                            color: ColorResources.getHintColor(context)),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomTextField(
                        hintText: "1234456",
                        isShowBorder: true,
                        isPassword: true,
                        isShowSuffixIcon: true,
                        focusNode: _passwordFocus,
                        controller: _passwordController,
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 20),

                      // for remember me section
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Padding(
                                padding: EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Row(children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: ColorResources.getCardBgColor(
                                          context),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: SizedBox.shrink(),
                                  ),
                                  SizedBox(
                                      width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    "Remember Me",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: Dimensions
                                                .FONT_SIZE_EXTRA_SMALL,
                                            color: ColorResources.getHintColor(
                                                context)),
                                  ),
                                ]),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context).pushNamed(
                                //     RouteHelper.forgetPassword,
                                //     arguments: ForgotPasswordScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Forgot Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                          color: ColorResources.getHintColor(
                                              context)),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 10),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox.shrink(),
                            SizedBox(width: 8),
                          ]),
                      SizedBox(height: 10),

                      // for login button

                      CustomButton(
                        buttonText: "Login",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Material(
                                  child: MainScreen(),
                                ),
                              ),
                              (route) => false);
                        },
                      ),
                      SizedBox(height: 20),

                      // for create an account
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => SignUpScreen()),
                              (route) => false);
                        },
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Create an account",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.getHintColor(
                                            context)),
                                  ),
                                  SizedBox(
                                      width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    "Sign Up",
                                    style: poppinsMedium.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.getTextColor(
                                            context)),
                                  ),
                                ])),
                      ),

                      Center(
                          child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(1, 40),
                        ),
                        onPressed: () {},
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Continue as',
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: ColorResources.getHintColor(context))),
                          TextSpan(
                              text: " Guest",
                              style: poppinsRegular.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color)),
                        ])),
                      )),
                    ],
                  )
                ],
              ),
            )),
          ]),
        ),
      ))),
    );
  }
}
