import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rede_social_flutter/src/modules/auth/data/dtos/user_dto.dart';

//TODO verificar a necessidade de esse arquivo ser .g
class AuthDatasource {
  AuthDatasource({
    required this.firebaseAuth,
    required this.db,
  });
  FirebaseAuth firebaseAuth;
  FirebaseFirestore db;

  Future<void> createAccountFirebaseAuth({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Erro ao criar usuário no Auth: ${e.message}');
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-credential') {
        message = 'The supplied auth credential is incorrect, malformed or has expired.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      throw Exception(message);
    }
  }

  Future<void> createUserFirestore({
    required UserDto user,
  }) async {
    try {
      Map<String, dynamic> phoneJson = user.phone!.toJson();
      Map<String, dynamic> userJson = user.toJson();
      userJson['phone'] = phoneJson;
      await db.collection('Users').add(userJson);
    } catch (e) {
      throw Exception('Erro ao criar cadastro do usuário no Firestore: ${e.toString()}');
    }
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      throw Exception('Erro ao resetar senha: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Erro ao fazer logout: ${e.toString()}');
    }
  }
}
