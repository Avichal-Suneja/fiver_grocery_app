import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final auth = FirebaseAuth.instance;

class AuthService {
  late ConfirmationResult confirmationResult;

  Stream<User?> currentUserStream = auth.userChanges();
  User? currentUser = auth.currentUser;

  /// [Login with email and password]
  Future<String> signInWithEmail(String email, String pass,
      [bool admin = false]) async {
    assert(email.isNotEmpty && pass.isNotEmpty);
    print('$email, $pass');
    String msg = 'login successful';
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      log('$e');
      Get.rawSnackbar(title: 'Something Went Wrong!', message: '${e.code}');
    }
    return msg;
  }

  Future<String> signUpWithEmail(String email, String pass,
      [bool admin = false]) async {
    assert(email.isNotEmpty && pass.isNotEmpty);
    print('$email, $pass');
    String msg = 'login successful';
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      log('$e');
      Get.rawSnackbar(title: 'Something Went Wrong!', message: '${e.code}');
    }
    return msg;
  }

  /// [Sign Out a User]
  Future<void> logout() async {
    await auth.signOut();
  }
}
