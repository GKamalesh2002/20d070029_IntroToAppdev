import 'package:flutter/material.dart';
import 'package:budget_recorder/services/auth.dart';
import 'package:budget_recorder/shared/constants.dart';
import 'package:budget_recorder/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
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
        title: Text("Sign up to Brew Crew"),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: Icon(Icons.person),
              label: Text("Sign in"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey, // We are associating the Global key with our form to access some validation techniques
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
              SizedBox(height: 20.0,),
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
                  // print(email);
                  // print(password);
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  if(result == null){
                    setState(() {
                      loading = false;
                      error = 'please provide a valid email';
                    });
                  }
                  // else case is not required because upon successful registration, the home screen is displayed
                }
              },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink[400])
                  ),
                  child: Text(
                    "Register",
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
