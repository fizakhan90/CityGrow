import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
         FirebaseAuth.instance.currentUser?.getIdToken().then((token) {
  print("========== ID Token ==========");
  print(token);
  print("========== END ==========");
});


      return result.user;
    } catch (e) {
      throw e.toString();
    }
  }

  
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      throw e.toString();
    }
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }
}
