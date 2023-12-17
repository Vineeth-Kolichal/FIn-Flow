import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> googleSignIn();
  Future<Either<Failure, String>> logout();
}
