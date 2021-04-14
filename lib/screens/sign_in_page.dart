import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tripyojana/utils/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 48,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: new InputDecoration(hintText: "Email", contentPadding: const EdgeInsets.all(20.0)),
            controller: emailController,
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: passwordController,
            decoration: new InputDecoration(hintText: "Password", contentPadding: const EdgeInsets.all(20.0)),
          ),
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
                  color: Colors.white),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 28.8, right: 28.8),
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
          SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}
