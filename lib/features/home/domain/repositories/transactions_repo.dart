import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/features/home/domain/usecases/add_category_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/add_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/delete_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/generate_report_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_transactions_usecase.dart';

import '../entities/transaction_entity.dart';

abstract class TransactionsRepositories {
  Future<Either<Failure, List<String>>> getCategories(Cparams params);
  Future<Either<Failure, String>> addTransaction(AddParam addParm);
  Future<Either<Failure, List<TransactionEntity>>> getTransactions(
      DateParams params);
  Future<Either<Failure, String>> addCategory(AddCategoryParam param);
  Future<Either<Failure, String>> deleteTransaction(DeleteParam param);
  Future<Either<Failure, String>> generateReport(PdfParam param);
}
