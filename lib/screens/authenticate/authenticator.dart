import 'package:flutter/material.dart';
import 'package:budget_recorder/screens/authenticate/sign_in.dart';
import 'package:budget_recorder/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true; // When we first open the app this is true and hence the signin page gets rendered
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn; // Used to toggle the showSignIn each time it is called
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) return SignIn(toggleView: toggleView);
    else return Register(toggleView: toggleView);
  }
}