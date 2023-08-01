import 'package:flutter/material.dart';
import 'package:budget_recorder/shared/constants.dart';
import 'package:budget_recorder/shared/loading.dart';
import 'package:budget_recorder/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService(); // A custom class encapsulating authorization related functionalities
  // text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) => (val == null || val.isEmpty) ? 'Enter an email' : null,
                onChanged: (val){// val represents the entry in the formfield
                  setState(() {
                    email = val; // Updating the email state variable as we type
                  });
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (val) => (val == null || val.length < 6) ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(onPressed: ()async{
                if(_formKey.currentState?.validate() == true){ // ?. is null aware operator
                  setState(() {
                    loading = true;// The loading page should appear once the email and password are validated
                  });
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  // print(email);
                  // print(password);
                  if(result == null) {
                    setState(() {
                      loading = false;
                    });
                    setState(() {
                      error = 'couldnot sign in with those credentials';
                    });
                  }
                }
                // else case is not required because upon successful registration, the home screen is displayed
              }
                  ,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink[400])
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  )
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
        // child: ElevatedButton(
        //   onPressed: () async{
        //     dynamic result = await _auth.signInAnon();
        //     if(result == null){
        //       print("error signing in");
        //     }
        //     else{
        //       print("signed in");
        //       print(result.uid);
        //     }
        //     }, // dynamic since it could be user or null
        //   child: Text("Sign in anon"),
        // ),
      ),
    );
  }
}