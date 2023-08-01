import 'package:budget_recorder/models/expwithid.dart';
import 'package:budget_recorder/screens/home/exp_list.dart';
import 'package:budget_recorder/screens/home/expenses.dart';
import 'package:budget_recorder/services/auth.dart';
import 'package:budget_recorder/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:budget_recorder/models/user.dart';
import 'package:budget_recorder/screens/home/wrapper.dart';
import 'screens/home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value( // This received values of type Users? from the stream and provides the data to its descendants
      value: AuthService().user, // It specifies the data to be provided
      initialData: null,
      child: Consumer<Users?>(
        builder: (context,userData,_) {
          String? uid = userData?.uid;
          return StreamProvider<List<ExpWithId>>.value(
            value: DatabaseService(uid:uid).exps,
            initialData: [],
            child: MaterialApp( // It specifies the descendants
              home: Wrapper(),
              // This widget is expected to handle the conditional checks and display appropriate UI
              routes: {
                '/expense': (context) => Expenses(uid: uid),
                '/home': (context) => Home(uid: uid),
              },
            ),
          );
        },
      ),
    );
  }
}
