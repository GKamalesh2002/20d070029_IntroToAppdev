import 'package:flutter/material.dart';
import 'package:budget_recorder/screens/authenticate/authenticator.dart';
import 'package:provider/provider.dart';
import 'package:budget_recorder/models/user.dart';
import 'package:budget_recorder/screens/home/home.dart';

class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context); // used to obtain the current value of state
    String? id = user?.uid;
    if(user == null){
      return Authenticate();
    }
    else{
      return Home(uid: user.uid,);
    }
  }
}