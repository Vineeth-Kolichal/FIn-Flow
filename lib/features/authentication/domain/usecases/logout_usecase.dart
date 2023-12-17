import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/authentication/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class LogoutUseCase implements UseCase<String, NoParams> {
  AuthRepo authRepo;
  LogoutUseCase(this.authRepo);
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await authRepo.logout();
  }
}
