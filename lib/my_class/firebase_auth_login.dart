import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_box/Pages/main.dart';
import 'package:share_box/my_class/firebase_auth_error.dart';

class FirebaseLogin {
  /*idログインのメソッド
  *
  * */
  static Future<FirebaseAuthResultStatus> signInId(
      String email, String password) async {
    FirebaseAuthResultStatus result;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (userCredential.user! != null) {
        result = FirebaseAuthResultStatus.Successful;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      result = FirebaseAuthExceptionHandler.handleException(e);
    }
    return result;
  }

  static void showErrorDialog(BuildContext context, String? message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(message!),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
          ],
        );
      },
    );
  }
}

// 自動ログイン用の状態保持
class UserState extends ChangeNotifier {
  User? _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
