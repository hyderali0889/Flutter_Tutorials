import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../View/Routes/routes.dart';

FirebaseAuth auth = FirebaseAuth.instance;

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo());

class AuthRepo {
  Stream<User?> get user => auth.idTokenChanges();

  void login(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        context.goNamed(Routes().loading);
      }
    } catch (e) {
      print(e);
    }
  }

  void singOut() async{
   await auth.signOut();

  }
}
