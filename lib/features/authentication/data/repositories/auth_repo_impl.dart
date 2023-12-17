import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/exception.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/features/authentication/data/datasources/authentication.dart';
import 'package:fin_flow/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
@injectable
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl(this.authDataSource);
  @override
  Future<Either<Failure, String>> googleSignIn() async {
    try {
      await authDataSource.googleLogin();
      return const Right("Success");
    } on AuthException catch (e) {
      return Left(Failure.authError(e.error));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final msg = await authDataSource.logout();
      return Right(msg);
    } on AuthException catch (e) {
      return Left(Failure.authError(e.error));
    }
  }
}
