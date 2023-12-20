import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class GenerateReportUsecase implements UseCase<String, PdfParam> {
  TransactionsRepositories transactionsRepositories;
  GenerateReportUsecase(this.transactionsRepositories);
  @override
  Future<Either<Failure, String>> call(PdfParam params) async {
    return await transactionsRepositories.generateReport(params);
  }
}

class PdfParam {
  final List<TransactionEntity> transactions;
  final DateTime fromDate;
  final DateTime todate;

  PdfParam(
      {required this.transactions,
      required this.fromDate,
      required this.todate});
}
