// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:fin_flow/core/dependancy_injection/modules/google_sign_in.dart'
    as _i22;
import 'package:fin_flow/core/dependancy_injection/modules/main_collection_ref_module.dart'
    as _i21;
import 'package:fin_flow/features/authentication/data/datasources/authentication.dart'
    as _i10;
import 'package:fin_flow/features/authentication/data/repositories/auth_repo_impl.dart'
    as _i12;
import 'package:fin_flow/features/authentication/domain/repositories/auth_repo.dart'
    as _i11;
import 'package:fin_flow/features/authentication/domain/usecases/auth_usecase.dart'
    as _i13;
import 'package:fin_flow/features/authentication/domain/usecases/logout_usecase.dart'
    as _i18;
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart'
    as _i20;
import 'package:fin_flow/features/home/data/datasources/transactions_data_source.dart'
    as _i5;
import 'package:fin_flow/features/home/data/repositories/transactions_repo_impl.dart'
    as _i7;
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart'
    as _i6;
import 'package:fin_flow/features/home/domain/usecases/add_category_usecase.dart'
    as _i8;
import 'package:fin_flow/features/home/domain/usecases/add_transactions_usecase.dart'
    as _i9;
import 'package:fin_flow/features/home/domain/usecases/delete_transactions_usecase.dart'
    as _i14;
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart'
    as _i15;
import 'package:fin_flow/features/home/domain/usecases/get_transactions_usecase.dart'
    as _i16;
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/add_transaction_sheet_cubit/add_transaction_sheet_cubit.dart'
    as _i19;
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart'
    as _i17;
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
    gh.lazySingleton<_i5.TransactionDataSource>(() =>
        _i5.TransactionsDataSourceImpl(gh<_i3.CollectionReference<Object?>>()));
    gh.lazySingleton<_i6.TransactionsRepositories>(
        () => _i7.TransactionsRepoImpl(gh<_i5.TransactionDataSource>()));
    gh.lazySingleton<_i8.AddCategoryUseCase>(
        () => _i8.AddCategoryUseCase(gh<_i6.TransactionsRepositories>()));
    gh.lazySingleton<_i9.AddTransactionsUseCase>(
        () => _i9.AddTransactionsUseCase(gh<_i6.TransactionsRepositories>()));
    gh.lazySingleton<_i10.AuthDataSource>(() => _i10.AuthDataSourceImpl(
          gh<_i4.GoogleSignIn>(),
          gh<_i3.CollectionReference<Object?>>(),
        ));
    gh.lazySingleton<_i11.AuthRepo>(
        () => _i12.AuthRepoImpl(gh<_i10.AuthDataSource>()));
    gh.factory<_i13.AuthUseCase>(() => _i13.AuthUseCase(gh<_i11.AuthRepo>()));
    gh.lazySingleton<_i14.DeleteTransactionUsecase>(() =>
        _i14.DeleteTransactionUsecase(gh<_i6.TransactionsRepositories>()));
    gh.factory<_i15.GetCategoriesUseCase>(
        () => _i15.GetCategoriesUseCase(gh<_i6.TransactionsRepositories>()));
    gh.lazySingleton<_i16.GetTransactionsUsecase>(
        () => _i16.GetTransactionsUsecase(gh<_i6.TransactionsRepositories>()));
    gh.factory<_i17.HomeScreenBloc>(() => _i17.HomeScreenBloc(
          gh<_i16.GetTransactionsUsecase>(),
          gh<_i14.DeleteTransactionUsecase>(),
        ));
    gh.lazySingleton<_i18.LogoutUseCase>(
        () => _i18.LogoutUseCase(gh<_i11.AuthRepo>()));
    gh.factory<_i19.AddTransactionSheetCubit>(
        () => _i19.AddTransactionSheetCubit(
              gh<_i15.GetCategoriesUseCase>(),
              gh<_i9.AddTransactionsUseCase>(),
              gh<_i8.AddCategoryUseCase>(),
            ));
    gh.factory<_i20.AuthenticationBloc>(() => _i20.AuthenticationBloc(
          gh<_i13.AuthUseCase>(),
          gh<_i18.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$MainCollectionRef extends _i21.MainCollectionRef {}

class _$GoogleModule extends _i22.GoogleModule {}
