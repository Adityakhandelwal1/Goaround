import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:tripyojana/utils/authentication_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
      body: Stack(
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/background.jpeg'),
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  fit: BoxFit.cover,
                ),
              ),
              // color: _backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      'Welcome!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(fontSize: 45.6,color: _headingColor, fontWeight: FontWeight.w400),
                      // style: TextStyle(
                      //   color: _headingColor,
                      //   fontSize: 45.6,
                      // ),
                      // style: GoogleFonts.playfairDisplay(
                      //     color: _headingColor,
                      //     fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ),
                  //Get Started Button
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(32),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFF000000),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            height: _loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
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
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          hintText: "Email",
                          contentPadding: const EdgeInsets.all(20.0)),
                      controller: emailController,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      decoration: new InputDecoration(
                          hintText: "Password",
                          contentPadding: const EdgeInsets.all(20.0)),
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

                //SignIn and Create New Account button
                Container(
                  child: Column(children: [
                    MaterialButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      },
                      child: Container(
                        height: 62.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Color(0xFF000000),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 28.8, right: 28.8),
                            child: Text(
                              'Sign in',
                              style: GoogleFonts.lato(
                                  fontSize: 19.2,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: Container(
                        height: 62.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 28.8, right: 28.8),
                            child: Text(
                              'New Account?',
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
          ),
          AnimatedContainer(
            height: _registerHeight,
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
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
                      onPressed: () {
                        context.read<AuthenticationService>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      },
                      child: Container(
                        height: 62.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Color(0xFF000000)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 28.8, right: 28.8),
                            child: Text(
                              'Create Account',
                              style: GoogleFonts.lato(
                                  fontSize: 19.2,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _pageState = 1;
                        });
                      },
                      child: Container(
                        height: 62.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 28.8, right: 28.8),
                            child: Text(
                              'Back to Login',
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
          )
        ],
      ),
    );
  }
}

// class InputWithIcon extends StatefulWidget {
//   final IconData icon;
//   final String hint;
//   InputWithIcon({this.icon, this.hint});
//
//   @override
//   _InputWithIconState createState() => _InputWithIconState();
// }
//
// class _InputWithIconState extends State<InputWithIcon> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: Color(0xFFBC7C7C7),
//               width: 2
//           ),
//           borderRadius: BorderRadius.circular(50)
//       ),
//       child: Row(
//         children: <Widget>[
//           Container(
//               width: 60,
//               child: Icon(
//                 widget.icon,
//                 size: 20,
//                 color: Color(0xFFBB9B9B9),
//               )
//           ),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   border: InputBorder.none,
//                   hintText: widget.hint
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
// class PrimaryButton extends StatefulWidget {
//   final String btnText;
//   PrimaryButton({this.btnText});
//
//   @override
//   _PrimaryButtonState createState() => _PrimaryButtonState();
// }
//
// class _PrimaryButtonState extends State<PrimaryButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Color(0xFFB40284A),
//           borderRadius: BorderRadius.circular(50)
//       ),
//       padding: EdgeInsets.all(20),
//       child: Center(
//         child: Text(
//           widget.btnText,
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 16
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OutlineBtn extends StatefulWidget {
//   final String btnText;
//   OutlineBtn({this.btnText});
//
//   @override
//   _OutlineBtnState createState() => _OutlineBtnState();
// }
//
// class _OutlineBtnState extends State<OutlineBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: Color(0xFFB40284A),
//               width: 2
//           ),
//           borderRadius: BorderRadius.circular(50)
//       ),
//       padding: EdgeInsets.all(20),
//       child: Center(
//         child: Text(
//           widget.btnText,
//           style: TextStyle(
//               color: Color(0xFFB40284A),
//               fontSize: 16
//           ),
//         ),
//       ),
//     );
//   }
// }
