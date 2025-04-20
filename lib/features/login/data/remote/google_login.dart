import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:perfume_ecommerce/core/helper/bloc_observer.dart';

class GoogleLogin {
  Future<UserCredential> signInWithGoogle() async {
    //begin interaction with the GoogleSignIn object
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //once signed in, return the UserCredential
    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    PrintHelper(userCredential.toString());
    return userCredential;
  }
}
