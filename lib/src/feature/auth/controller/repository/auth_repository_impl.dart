import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/auth_status.dart';
import '../../../../core/constants/constants.dart';
import '../../model/user_data_model.dart';
import 'auth_repository.dart';


class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStoreDB = FirebaseFirestore.instance;

  @override
  Future<AuthStatus> loginUser({required LoginUserData userData}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: userData.email,
        password: userData.passWord,
      );
      return AuthStatus.loginSuccess;
    } on FirebaseAuthException catch (e) {
      return getAuthStatus(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthStatus> signUpUser({required SignUpUserData userData}) async {
    try {
      _auth.currentUser;
      await _auth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.passWord,
      );

      return AuthStatus.signUpSuccess;
    } on FirebaseAuthException catch (e) {
      return getAuthStatus(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthStatus> forgotPassword({required String userEmail}) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: userEmail,
      );
      return AuthStatus.resetPasswordSuccess;
    } on FirebaseAuthException catch (e) {
      return getAuthStatus(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> createUserAccount({required String userName}) async {
    try {
      final String userId = _auth.currentUser?.uid ?? '';

      final String emailId = _auth.currentUser?.email ?? '';
      final UserDataModel model =
          UserDataModel(emailId: emailId, name: userName);

      await _fireStoreDB
          .collection(AppConstants.userCollectionName)
          .doc(userId)
          .set(model.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
