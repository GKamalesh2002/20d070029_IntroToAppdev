import 'package:budget_tracker/pages/expenses.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/home.dart';
// import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes:{
    // '/': (context)=> Loading(),// context tracks the position in the widget tree
    '/home': (context) => Home(),
    '/expense': (context) => Expenses(),
  },
));