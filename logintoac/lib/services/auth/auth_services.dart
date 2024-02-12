
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{

  //instance of auth
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  //instancec of firestore
  final FirebaseFirestore _fireStore=FirebaseFirestore.instance;

  //sign user
  Future<UserCredential> SignInWithEmailandPassword(
    String email, String password)async{
    try{
      UserCredential userCredential=
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
        );

         //create document for user
        _fireStore.collection('users').doc(userCredential.user!.uid).set({
          'uid' : userCredential.user!.uid,
          'email' : email,
        },
        SetOptions(merge: true),
        );

        return userCredential;

    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  //createt new user
  Future<UserCredential>signInWithEmailAndPassword(String email,password)async{
    try{
      UserCredential userCredential=
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
        );

         //create document for user
        _fireStore.collection('users').doc(userCredential.user!.uid).set({
          'uid' : userCredential.user!.uid,
          'email' : email,
        });

        return userCredential;

    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  Future <void> signOut() async{
  return await FirebaseAuth.instance.signOut();
  }

}