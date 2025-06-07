import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/user/data/model/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<String> login(String email, String password);
  Future<String> register(String email, String password, String name);
  Future<void> logout();
  Stream<String?> get authStateChanges;
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<String> login(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user!.uid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> register(String email, String password, String name) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: result.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now(),
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(result.user!.uid)
          .set(user.toJson());

      return result.user!.uid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Stream<String?> get authStateChanges {
    // autentifikatsiya holati yani u logout qb chqb ketganm yoki ilovaga login register blan krganm
    return firebaseAuth.authStateChanges().map((e) => e?.uid);
  }
}
