import 'dart:math';

import 'package:budget_recorder/models/expwithid.dart';
import 'package:budget_recorder/services/database.dart';
import 'package:flutter/material.dart';
import  'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:budget_recorder/screens/home/expenses_card.dart';
import 'package:budget_recorder/screens/home/expense_tile.dart';

class ExpList extends StatefulWidget {
  String? uid;
  ExpList({required this.uid});
  @override
  State<ExpList> createState() => _ExpListState();
  int? calculator(List<ExpWithId> lis){
    int total = 0;
    lis.forEach((element) {
      total = total + element.price;
    });
    return total;
  }
}


class _ExpListState extends State<ExpList> {
  @override
  Widget build(BuildContext context) {
    final List<ExpWithId> exps = Provider.of<List<ExpWithId>>(context);
    int? total = widget.calculator(exps);
    // return ListView.builder(
    //     itemCount: exps.length,
    //     itemBuilder: (context,index){
    //       return ExpenseCard(expense: exps[index], delete: (){});
    //     });
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 35.0,
                  width: 300.0,
                  child: Row(
                    children: [
                      Text("Total:",
                      style: TextStyle(
                        fontSize: 32.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Spacer(),
                      Text("$total",
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 1.0,
                      ),)
                    ],
                  ),
                ),
              ),
              ),
            ],
            ),
        Container(
          child: SizedBox(
            height: 500,
            child: Column(
              children: exps.map((exp) => Expanded(
                child: ExpenseCard(expense: exp, delete:
                ()=>{
                  DatabaseService(uid: widget.uid).deleteExpense(exp.id)
                }
                )
              )).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
// ExpenseCard(expense: exp, delete: (){
// DatabaseService(uid: widget.uid).deleteExpense(exp.id);
// }),