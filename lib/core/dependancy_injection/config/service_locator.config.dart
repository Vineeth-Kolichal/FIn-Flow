// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:fin_flow/core/dependancy_injection/modules/firestore_module.dart'
    as _i6;
import 'package:fin_flow/core/dependancy_injection/modules/google_sign_in.dart'
    as _i7;
import 'package:fin_flow/features/authentication/data/datasources/authentication.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firestoreModule = _$FirestoreModule();
    final googleModule = _$GoogleModule();
    gh.lazySingleton<_i3.FirebaseFirestore>(() => firestoreModule.firestore);
    gh.lazySingleton<_i4.GoogleSignIn>(() => googleModule.dioInstance);
    gh.factory<_i5.Authentication>(
        () => _i5.Authentication(gh<_i4.GoogleSignIn>()));
    return this;
  }
}

class _$FirestoreModule extends _i6.FirestoreModule {}

class _$GoogleModule extends _i7.GoogleModule {}
