import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_flow/core/error/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<String> googleLogin();
}

@LazySingleton(as: AuthDataSource)
@injectable
class AuthDataSourceImpl implements AuthDataSource {
  final GoogleSignIn googleSignIn;
  final CollectionReference collectionRef;
  AuthDataSourceImpl(this.googleSignIn, this.collectionRef);
  @override
  Future<String> googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) throw AuthException("Failed");
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((userCred) async {
        final uid = userCred.user?.uid;
        if (uid != null) {
          final docSnap = await collectionRef.doc(uid).get();
          if (docSnap.exists == false) {
            collectionRef.doc(uid).set({
              "incomeCategory": {"1": "Salary", "2": "Profit", "3": "Divident"},
              "expenceCategory": {"1": "Rent", "2": "Food", "3": "Travel"}
            });
          }
        }
      });
      return "Success";
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
