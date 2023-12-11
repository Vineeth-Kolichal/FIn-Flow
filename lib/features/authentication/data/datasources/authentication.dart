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
              final categoryRef =
                  collectionRef.doc(uid).collection('Categories');
              List<Map<String, dynamic>> defaultCategories = [
                {"type": "income", "name": "Salary"},
                {"type": "income", "name": "Profit"},
                {"type": "income", "name": "Credit"},
                {"type": "income", "name": "Other"},
                {"type": "expence", "name": "Rent"},
                {"type": "expence", "name": "Food"},
                {"type": "expence", "name": "Travel"},
                {"type": "expence", "name": "Misc"},
                {"type": "expence", "name": "Shopping"},
              ];
              for (var cat in defaultCategories) {
                await categoryRef.add(cat);
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
