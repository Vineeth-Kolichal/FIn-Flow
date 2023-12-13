import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/transaction_entity.dart';

@lazySingleton
@injectable
class GetTransactionsUsecase
    implements UseCase<List<TransactionEntity>, DateParams> {
  TransactionsRepositories transactionsRepositories;
  GetTransactionsUsecase(this.transactionsRepositories);
  @override
  Future<Either<Failure, List<TransactionEntity>>> call(
      DateParams params) async {
    return transactionsRepositories.getTransactions(params);
  }
}

class DateParams {
  final DateTime fromDate;
  final DateTime toDate;
  DateParams({required this.fromDate, required this.toDate});
}
