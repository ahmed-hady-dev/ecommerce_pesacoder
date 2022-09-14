import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FirebaseAuthHelper {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static SnackBar customSnackBar({required String content, Color? color}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: color ?? Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

//===============================================================

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential = await auth.signInWithPopup(authProvider);
        user = userCredential.user;
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'Sign in successfully',
            color: Colors.white,
          ),
        );
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);
          user = userCredential.user;
          ScaffoldMessenger.of(context).showSnackBar(
            FirebaseAuthHelper.customSnackBar(
              content: 'Sign in successfully',
              color: Colors.white,
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              FirebaseAuthHelper.customSnackBar(
                content: 'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              FirebaseAuthHelper.customSnackBar(
                content: 'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            FirebaseAuthHelper.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

//===============================================================

  static Future<User?> signInWithFacebook({required BuildContext context}) async {
    User? user;
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
        final UserCredential userCredential = await auth.signInWithCredential(facebookAuthCredential);
        user = userCredential.user;
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'Sign in successfully',
            color: Colors.white,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'Some error occurred : ${result.message}',
            color: Colors.white,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'The account already exists with a different credential',
          ),
        );
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'Error occurred while accessing credentials. Try again.',
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        FirebaseAuthHelper.customSnackBar(
          content: 'Error occurred using Facebook Sign In. Try again.',
        ),
      );
    }
    return user;
  }

//===============================================================
  static Future<User?> signInWithEmailAndPassword(
      {required String email, required String password, required context}) async {
    User? user;
    try {
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'The account already exists with a different credential',
          ),
        );
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          FirebaseAuthHelper.customSnackBar(
            content: 'Error occurred while accessing credentials. Try again.',
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        FirebaseAuthHelper.customSnackBar(
          content: 'Error occurred using email. Try again.',
        ),
      );
    }
    return user;
  }
//===============================================================

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        FirebaseAuthHelper.customSnackBar(
          content: 'Sign out successfully',
          color: Colors.white,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        FirebaseAuthHelper.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}
