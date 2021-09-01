import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:tripyojana/utils/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool missionVisionLabel = true;
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  static final _formkey = GlobalKey<FormState>();
  static final _formkey2 = GlobalKey<FormState>();

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFF000000);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordController2 = TextEditingController();

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFF000000);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white60;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 228, 222, 1),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: screenWidth * 0.08, top: screenWidth * 0.12),
            child: CircleAvatar(
              radius: screenHeight * 0.06,
              backgroundColor: Color.fromRGBO(140, 189, 208, 1),
            ),
          ),
          //Welcome page
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // 2 liner about the brand
              Visibility(
                visible: missionVisionLabel,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(screenHeight * 0.06),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      padding: EdgeInsets.all(screenHeight * 0.04),
                      color: Color.fromRGBO(248, 242, 239, 1),
                      child: Text("2 liner about the brand",
                          style: GoogleFonts.lato(
                              fontSize: 19.2,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                ),
              ),

              //Sign In Methods
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Google Sign in Button
                      MaterialButton(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.025,
                            right: screenHeight * 0.025,
                            top: screenHeight * 0.025),
                        onPressed: () {
                          final provider = Provider.of<AuthenticationService>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.1,
                                  right: screenWidth * 0.1),
                              child: Icon(FontAwesomeIcons.google,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      //Sign in button
                      MaterialButton(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.025,
                            right: screenHeight * 0.025,
                            top: screenHeight * 0.025),
                        onPressed: () {
                          missionVisionLabel = false;
                          setState(() {
                            if (_pageState != 0) {
                              _pageState = 0;
                            } else {
                              _pageState = 1;
                            }
                          });
                        },
                        child: Container(
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.1,
                                  right: screenWidth * 0.1),
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.lato(
                                    fontSize: 19.2,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(79, 91, 111, 1)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //New Account Button
                      MaterialButton(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.025,
                            right: screenHeight * 0.025,
                            top: screenHeight * 0.025),
                        onPressed: () {
                          missionVisionLabel = false;
                          setState(() {
                            _pageState = 2;
                          });
                        },
                        child: Container(
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: Colors.white),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.1,
                                  right: screenWidth * 0.1),
                              child: Text(
                                'Create an account',
                                style: GoogleFonts.lato(
                                    fontSize: 19.2,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(79, 91, 111, 1)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          )),
          //login page
          AnimatedContainer(
              padding: EdgeInsets.all(32),
              width: _loginWidth,
              height: _loginHeight,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform:
                  Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
              decoration: BoxDecoration(
                color: Color.fromRGBO(200, 212, 216, 1),
                  // color: Colors.black.withOpacity(_loginOpacity),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Login To Continue",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          // keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                              hintText: "Email",
                              contentPadding: const EdgeInsets.all(20.0)),
                          controller: emailController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter an Email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          // keyboardType: TextInputType.text,
                          // autofocus: false,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                              hintText: "Password",
                              contentPadding: const EdgeInsets.all(20.0)),
                          controller: passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter a Password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    //SignIn and Create New Account button
                    Container(
                      child: Column(children: [
                        //Google Sign in Button
                        MaterialButton(
                          padding: EdgeInsets.only(
                              left: screenHeight * 0.025,
                              right: screenHeight * 0.025,
                              top: screenHeight * 0.025),
                          onPressed: () {
                            final provider = Provider.of<AuthenticationService>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 28.8, right: 28.8),
                                child: Icon(FontAwesomeIcons.google,
                                    color: Colors.red),
                              ),
                            ),
                          ),
                        ),

                        //Sign in button
                        MaterialButton(
                          padding: EdgeInsets.only(
                              left: screenHeight * 0.025,
                              right: screenHeight * 0.025,
                              top: screenHeight * 0.025),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              context.read<AuthenticationService>().signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                            } else {
                              print("UnSuccessfull");
                            }
                          },
                          child: Container(
                            height: 62.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color:Color.fromRGBO(235, 239, 240, 1)
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 28.8, right: 28.8),
                                child: Text(
                                  'Sign in',
                                  style: GoogleFonts.lato(
                                      fontSize: 19.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //New Account Button
                        MaterialButton(
                          padding: EdgeInsets.all(screenHeight * 0.025,),
                          onPressed: () {
                            setState(() {
                              _pageState = 2;
                            });
                          },
                          child: Container(
                            height: 62.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                color: Color.fromRGBO(235, 239, 240, 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 28.8, right: 28.8),
                                child: Text(
                                  'Need an account? Sign up',
                                  style: GoogleFonts.lato(
                                      fontSize: 19.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),

                    // Column(
                    //   children: <Widget>[
                    //     PrimaryButton(
                    //       btnText: "Login",
                    //     ),
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           _pageState = 2;
                    //         });
                    //       },
                    //       child: OutlineBtn(
                    //         btnText: "Create New Account",
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              )),
          //signup page
          AnimatedContainer(
            height: _registerHeight,
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Color.fromRGBO(200, 212, 216, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),

            // child: Column(
            //   children: [
            //     SizedBox(height: SizeConfig.screenHeight * 0.04),
            //     Text(
            //       "Welcome Back",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: getProportionateScreenWidth(28),
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(
            //       "Sign in with your email and password  \nor continue with social media",
            //       textAlign: TextAlign.center,
            //     ),
            //     SizedBox(height: SizeConfig.screenHeight * 0.08),
            //     // SignForm(),
            //     SizedBox(height: SizeConfig.screenHeight * 0.08),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         GestureDetector(
            //           onTap: () {},
            //           child: Container(
            //             margin: EdgeInsets.symmetric(
            //                 horizontal: getProportionateScreenWidth(10)),
            //             padding:
            //                 EdgeInsets.all(getProportionateScreenWidth(12)),
            //             height: getProportionateScreenHeight(40),
            //             width: getProportionateScreenWidth(40),
            //             decoration: BoxDecoration(
            //               color: Color(0xFFF5F6F9),
            //               shape: BoxShape.circle,
            //             ),
            //             child: SvgPicture.asset("assets/svg/google-icon.svg"),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {},
            //           child: Container(
            //             margin: EdgeInsets.symmetric(
            //                 horizontal: getProportionateScreenWidth(10)),
            //             padding:
            //                 EdgeInsets.all(getProportionateScreenWidth(12)),
            //             height: getProportionateScreenHeight(40),
            //             width: getProportionateScreenWidth(40),
            //             decoration: BoxDecoration(
            //               color: Color(0xFFF5F6F9),
            //               shape: BoxShape.circle,
            //             ),
            //             child: SvgPicture.asset("assets/svg/twitter.svg"),
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {},
            //           child: Container(
            //             margin: EdgeInsets.symmetric(
            //                 horizontal: getProportionateScreenWidth(10)),
            //             padding:
            //                 EdgeInsets.all(getProportionateScreenWidth(12)),
            //             height: getProportionateScreenHeight(40),
            //             width: getProportionateScreenWidth(40),
            //             decoration: BoxDecoration(
            //               color: Color(0xFFF5F6F9),
            //               shape: BoxShape.circle,
            //             ),
            //             child: SvgPicture.asset("assets/svg/facebook-2.svg"),
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(height: getProportionateScreenHeight(20)),
            //   ],
            // ),

            child: Form(
              key: _formkey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Create a New Account",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            hintText: "Email",
                            contentPadding: const EdgeInsets.all(20.0)),
                        controller: emailController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter an Email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        controller: passwordController,
                        decoration: new InputDecoration(
                            hintText: "Password",
                            contentPadding: const EdgeInsets.all(20.0)),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter a Password';
                          }
                          if (value.length < 6) {
                            return 'Please more than 6 characters';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        controller: passwordController2,
                        decoration: new InputDecoration(
                            hintText: "Confirm Password",
                            contentPadding: const EdgeInsets.all(20.0)),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please re-enter password';
                          }
                          if (passwordController.text !=
                              passwordController2.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                      ),
                      // InputWithIcon(
                      //   icon: Icons.email,
                      //   hint: "Enter Email...",
                      // ),
                      // SizedBox(height: 20,),
                      // InputWithIcon(
                      //   icon: Icons.vpn_key,
                      //   hint: "Enter Password...",
                      // )
                    ],
                  ),
                  Container(
                    child: Column(children: [
                      MaterialButton(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.025,
                            right: screenHeight * 0.025,
                            top: screenHeight * 0.025),
                        onPressed: () {
                          if (_formkey2.currentState.validate() &&
                              passwordController.text.trim() ==
                                  passwordController2.text.trim()) {
                            context.read<AuthenticationService>().signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          } else {
                            print("UnSuccessful");
                          }
                        },
                        child: Container(
                          height: 62.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: Color.fromRGBO(235, 239, 240, 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 28.8, right: 28.8),
                              child: Text(
                                'Create Account',
                                style: GoogleFonts.lato(
                                    fontSize: 19.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.all(screenHeight * 0.025),
                        onPressed: () {
                          setState(() {
                            _pageState = 1;
                          });
                        },
                        child: Container(
                          height: 62.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: Color.fromRGBO(235, 239, 240, 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 28.8, right: 28.8),
                              child: Text(
                                'Have an account? Login here',
                                style: GoogleFonts.lato(
                                    fontSize: 19.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
