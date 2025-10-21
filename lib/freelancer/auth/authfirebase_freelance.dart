import 'package:firebase_auth/firebase_auth.dart';

class AuthFireBaseFreelance {
  static Future<UserCredential> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var cred = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred;
  }

  static Future<UserCredential> signUp(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var cred = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred;
  }

  static signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}
