import 'package:flutter/material.dart';

class popup extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurpleAccent[100],
      title: Text('New Entry'),
      content: Container(
        height: 200,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              )
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            16.0), // Adjust the radius as needed
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.check,
          color: Colors.white,),
        ),
      ],
    );
  }
}
