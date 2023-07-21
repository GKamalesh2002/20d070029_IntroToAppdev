import 'package:budget_tracker/pages/popup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[200],
        title: Center(
          child: Text("Budget Tracker",
          style: TextStyle(
            fontSize: 35.0,
            color: Colors.white,
            ),
          ),
        ),
      ),

      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/user.jpg"),
              ),
              SizedBox(height: 10,),
              Text("Welcome",
              style: TextStyle(
                fontSize: 44.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0
                ),
              ),
              Text("Back!",
                style: TextStyle(
                    fontSize: 44.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 300.0,
                    height: 35,
                    child: Row(
                      children: [
                        Text("Total",
                        style: TextStyle(
                          fontSize: 32,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text("28000",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.pushNamed(context, '/expense');
                        },
                            icon: Icon(Icons.keyboard_double_arrow_down_rounded))
                      ],
                    ),
              ),
                ),
              )
            ],
          ),
        ),
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
      )
    );
  }
}
