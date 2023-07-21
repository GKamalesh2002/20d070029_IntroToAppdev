import 'package:budget_tracker/pages/expenses_card.dart';
import 'package:budget_tracker/pages/expense.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/popup.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> expenses = [
    Expense(
      category: "Salary",
      price: 100000
    ),
    Expense(
      category: "Groceries",
      price: -2000
    ),
    Expense(
      category: "Rent",
      price: -20000
    ),
    Expense(
        category: "Tour",
        price: -50000
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Budget Tracker",
          style: TextStyle(
            fontSize: 35.0
          ),),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
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
                        Text("28000",
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 1.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: SizedBox(
              height: 600,
              child: Column(
                children: expenses.map((expense) => Expanded(
                  child: ExpenseCard(expense: expense, delete: (){
                    setState(() {
                      expenses.remove(expense);
                    });
                  }),
                )).toList(),
              ),
            ),
          )
        ],
      ),
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
                builder: (BuildContext context)=> popup()
                );
            }
          ),
        ),
      ),
    );
  }
}

