import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';

class LogoutUseCase implements UseCase<String,NoParams>{
  @override
  Future<Either<Failure, String>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}