import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CurrentUserModule {
  @lazySingleton
  dynamic get currentUser => FirebaseAuth.instance.currentUser;
}
