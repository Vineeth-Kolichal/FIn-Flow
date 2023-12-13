import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class AddTransactionsUseCase implements UseCase<String, AddParam> {
  TransactionsRepositories addTransactionsRepositories;
  AddTransactionsUseCase(this.addTransactionsRepositories);

  @override
  Future<Either<Failure, String>> call(AddParam params) async {
    return await addTransactionsRepositories.addTransaction(params);
  }
}

class AddParam {
  TransactionEntity transaction;
  AddParam(this.transaction);
}
