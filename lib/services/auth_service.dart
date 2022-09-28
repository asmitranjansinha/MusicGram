// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:null_app/helper/helper_function.dart';
import 'package:null_app/services/database_services.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // REGISTER FUNCTION 
  Future registerUserWithEmailandPassword(
    String fullName, String email, String password
  ) async {
    try{
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password))
        .user!;

      if (user!= null){
        await DatabaseServices(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
  
  // login funciton 
  Future signInWithEmailandPassword(
    String email, String password
  ) async {
    try{
      User user = (await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password))
        .user!;

      if (user!= null){
        return true;
      }
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  // sign out func
  Future signOut() async {
    try{
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserEmailSF("");
      await HelperFunction.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}