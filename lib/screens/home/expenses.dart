import 'package:budget_recorder/screens/home/expenses_card.dart';
import 'package:budget_recorder/screens/home/exp_list.dart';
import 'package:flutter/material.dart';
import 'package:budget_recorder/screens/home/popup.dart';
import 'package:provider/provider.dart';

class Expenses extends StatefulWidget {
  final String? uid;
  Expenses({required this.uid});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // List<Expense> expenses = [
  //   Expense(
  //     category: "Salary",
  //     price: 100000
  //   ),
  //   Expense(
  //     category: "Groceries",
  //     price: -2000
  //   ),
  //   Expense(
  //     category: "Rent",
  //     price: -20000
  //   ),
  //   Expense(
  //       category: "Tour",
  //       price: -50000
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Budget Tracker",
          style: TextStyle(
            fontSize: 35.0
          ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: ExpList(uid: widget.uid,),
        floatingActionButton: CircleAvatar(
          radius: 22.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20.0,
            child: FloatingActionButton(
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.add),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context)=> Popup(uid: widget.uid)
                  );
                }
            ),
          ),
        )
    );
  }
}

