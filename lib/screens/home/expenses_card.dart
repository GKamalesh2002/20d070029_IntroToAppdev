import 'package:budget_recorder/models/expwithid.dart';
import 'package:flutter/material.dart';
import 'package:budget_recorder/screens/home/expenses.dart';

class ExpenseCard extends StatelessWidget {
  final ExpWithId expense;
  final VoidCallback delete;
  ExpenseCard({required this.expense,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(40),
          ),
          // margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              // color: Colors.white,
              height: 30.0,
              width: 250.0,
              child: Row(
                children: <Widget>[
                  Text(expense.category,
                    style: TextStyle(
                      fontSize: 24.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Spacer(),
                  Text("${expense.price}",
                    style: TextStyle(
                      fontSize: 24.0,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        IconButton(onPressed: delete, icon: Icon(Icons.delete,
        size: 40,)
        )
      ],
    );
  }
}

