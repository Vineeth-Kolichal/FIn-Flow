import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class DeleteTransactionUsecase implements UseCase<String, DeleteParam> {
  TransactionsRepositories transactionsRepositories;
  DeleteTransactionUsecase(this.transactionsRepositories);
  @override
  Future<Either<Failure, String>> call(DeleteParam params) async {
    return await transactionsRepositories.deleteTransaction(params);
  }
}

class DeleteParam {
  final String id;
  DeleteParam(this.id);
}
