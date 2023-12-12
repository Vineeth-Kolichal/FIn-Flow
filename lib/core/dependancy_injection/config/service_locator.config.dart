// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:fin_flow/core/dependancy_injection/modules/google_sign_in.dart'
    as _i17;
import 'package:fin_flow/core/dependancy_injection/modules/main_collection_ref_module.dart'
    as _i16;
import 'package:fin_flow/features/authentication/data/datasources/authentication.dart'
    as _i9;
import 'package:fin_flow/features/authentication/data/repositories/auth_repo_impl.dart'
    as _i11;
import 'package:fin_flow/features/authentication/domain/repositories/auth_repo.dart'
    as _i10;
import 'package:fin_flow/features/authentication/domain/usecases/auth_usecase.dart'
    as _i12;
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart'
    as _i13;
import 'package:fin_flow/features/home/data/datasources/add_transactions_data.dart'
    as _i5;
import 'package:fin_flow/features/home/data/repositories/add_transactions_repo_impl.dart'
    as _i7;
import 'package:fin_flow/features/home/domain/repositories/add_transactions_repo.dart'
    as _i6;
import 'package:fin_flow/features/home/domain/usecases/add_transactions_usecase.dart'
    as _i8;
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart'
    as _i14;
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/add_transaction_sheet_cubit/add_transaction_sheet_cubit.dart'
    as _i15;
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
    gh.lazySingleton<_i5.AddTransactionDataSource>(() =>
        _i5.AddTransactionsDataSourceImpl(
            gh<_i3.CollectionReference<Object?>>()));
    gh.lazySingleton<_i6.AddTransactionsRepositories>(
        () => _i7.AddTransactionsRepoImpl(gh<_i5.AddTransactionDataSource>()));
    gh.lazySingleton<_i8.AddTransactionsUseCase>(() =>
        _i8.AddTransactionsUseCase(gh<_i6.AddTransactionsRepositories>()));
    gh.lazySingleton<_i9.AuthDataSource>(() => _i9.AuthDataSourceImpl(
          gh<_i4.GoogleSignIn>(),
          gh<_i3.CollectionReference<Object?>>(),
        ));
    gh.lazySingleton<_i10.AuthRepo>(
        () => _i11.AuthRepoImpl(gh<_i9.AuthDataSource>()));
    gh.factory<_i12.AuthUseCase>(() => _i12.AuthUseCase(gh<_i10.AuthRepo>()));
    gh.factory<_i13.AuthenticationBloc>(
        () => _i13.AuthenticationBloc(gh<_i12.AuthUseCase>()));
    gh.factory<_i14.GetCategoriesUseCase>(
        () => _i14.GetCategoriesUseCase(gh<_i6.AddTransactionsRepositories>()));
    gh.factory<_i15.AddTransactionSheetCubit>(
        () => _i15.AddTransactionSheetCubit(
              gh<_i14.GetCategoriesUseCase>(),
              gh<_i8.AddTransactionsUseCase>(),
            ));
    return this;
  }
}

class _$MainCollectionRef extends _i16.MainCollectionRef {}

class _$GoogleModule extends _i17.GoogleModule {}
