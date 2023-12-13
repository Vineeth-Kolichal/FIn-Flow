import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class GetCategoriesUseCase implements UseCase<List<String>, Cparams> {
  TransactionsRepositories addTransactionsRepositories;
  GetCategoriesUseCase(this.addTransactionsRepositories);

  @override
  Future<Either<Failure, List<String>>> call(Cparams params) async {
    return await addTransactionsRepositories.getCategories(params);
  }
}

class Cparams {
  final String type;

  Cparams(this.type);
}
