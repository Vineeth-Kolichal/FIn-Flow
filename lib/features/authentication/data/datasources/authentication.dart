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
              "email": userCred.user?.email,
            }).then((_) async {
              final inRef =
                  collectionRef.doc(uid).collection('income-categories');
              final exRef =
                  collectionRef.doc(uid).collection('expence-categories');
              List<Map<String, dynamic>> incomeCat = [
                {"category-name": "Salary"},
                {"category-name": "Profit"},
                {"category-name": "Credit"},
                {"category-name": "Other"},
              ];
              List<Map<String, dynamic>> expenceCat = [
                {"category-name": "Rent"},
                {"category-name": "Food"},
                {"category-name": "Travel"},
                {"category-name": "Misc"},
              ];
              for (var cat in incomeCat) {
                await inRef.add(cat);
              }
              for (var cat in expenceCat) {
                await exRef.add(cat);
              }
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
