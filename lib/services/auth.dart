import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_recorder/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance; // private
  // create a user object based on FirebaseUser
  Users? _userFromFirebaseUser(User? user){
    return user != null ? Users(uid: user.uid):null; // Modifying the firebase user to only contain the uid
  }

  //auth change user stream
  // Streams are used for state management
  Stream<Users?> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    //.map((User? user){_userFromFirebaseUser(user);
    //});
  }// This function listens to changes in the user's authentication state and returns a Users? type.

  // sign in annon
  Future signInAnon() async {
    try {
      // AuthResult has been renamed to UserCredential
      // FirebaseUser has been renamed to User
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //method to sign in with email & pw
  Future signInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // register with email & pw
  Future registerWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // create a new user document with the user uid
      // await DatabaseService(uid:user?.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut(); // signout directly returns a null value
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}