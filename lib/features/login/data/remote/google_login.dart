import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  Future<UserCredential> signInWithGoogle() async {
    //begin interaction with the GoogleSignIn object
    


    GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '44485603355-h0u7kfhmf3bp7a1ienldo87losn3n2ae.apps.googleusercontent.com',
     
    );
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

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
    print(userCredential.toString());
    return userCredential;
  }
}
