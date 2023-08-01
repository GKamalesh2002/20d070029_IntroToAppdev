import 'package:budget_recorder/services/database.dart';
import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  String? uid;
  Popup({required this.uid});
  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  final _formKey = GlobalKey<FormState>();
  String? _category;
  int? _price;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurpleAccent[100],
      title: Text('New Entry'),
      content: Container(
        height: 200,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                  validator: (val) => (val == null || val.isEmpty) ? 'Please enter a category':null,
                  onChanged: (val) => setState(() {
                    _category = val;
                  })
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
                  validator: (val) => (val == null || val.isEmpty) ? 'Please enter a price': null,
                  onChanged: (val) => setState(() {
                    _price = int.parse(val);
                  })
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
            // print(_category);
            // print(_price);
            DatabaseService(uid: widget.uid).updateUserData(_category, _price);
            Navigator.of(context).pop();
          },
          child: Icon(Icons.check,
            color: Colors.white,),
        ),
      ],
    );
  }
}

