library firebase_auth_service;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> authStateChanges() {
    return _firebaseAuth
        .authStateChanges().first.asStream();
  }

  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredential =
        await _firebaseAuth.signInWithCredential(EmailAuthProvider.credential(
      email: email,
      password: password,
    ));
    return userCredential.user;
  }

  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  User get currentUser => _firebaseAuth.currentUser;

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}