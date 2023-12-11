// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:fin_flow/core/dependancy_injection/modules/google_sign_in.dart'
    as _i11;
import 'package:fin_flow/core/dependancy_injection/modules/main_collection_ref_module.dart'
    as _i10;
import 'package:fin_flow/features/authentication/data/datasources/authentication.dart'
    as _i5;
import 'package:fin_flow/features/authentication/data/repositories/auth_repo_impl.dart'
    as _i7;
import 'package:fin_flow/features/authentication/domain/repositories/auth_repo.dart'
    as _i6;
import 'package:fin_flow/features/authentication/domain/usecases/auth_usecase.dart'
    as _i8;
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart'
    as _i9;
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
    final mainCollectionRef = _$MainCollectionRef();
    final googleModule = _$GoogleModule();
    gh.lazySingleton<_i3.CollectionReference<Object?>>(
        () => mainCollectionRef.firestore);
    gh.lazySingleton<_i4.GoogleSignIn>(() => googleModule.dioInstance);
    gh.lazySingleton<_i5.AuthDataSource>(() => _i5.AuthDataSourceImpl(
          gh<_i4.GoogleSignIn>(),
          gh<_i3.CollectionReference<Object?>>(),
        ));
    gh.lazySingleton<_i6.AuthRepo>(
        () => _i7.AuthRepoImpl(gh<_i5.AuthDataSource>()));
    gh.factory<_i8.AuthUseCase>(() => _i8.AuthUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i9.AuthenticationBloc>(
        () => _i9.AuthenticationBloc(gh<_i8.AuthUseCase>()));
    return this;
  }
}

class _$MainCollectionRef extends _i10.MainCollectionRef {}

class _$GoogleModule extends _i11.GoogleModule {}
