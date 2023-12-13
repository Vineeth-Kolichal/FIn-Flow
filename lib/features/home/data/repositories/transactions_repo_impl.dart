import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/exception.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/features/home/data/datasources/transactions_data_source.dart';
import 'package:fin_flow/features/home/data/models/transaction_model.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:fin_flow/features/home/domain/usecases/add_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_transactions_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransactionsRepositories)
@injectable
class TransactionsRepoImpl implements TransactionsRepositories {
  TransactionDataSource transactionDataSource;
  TransactionsRepoImpl(this.transactionDataSource);
  @override
  Future<Either<Failure, List<String>>> getCategories(Cparams params) async {
    try {
      final data = await transactionDataSource.getCategories(params);
      return Right(data);
    } on DataException catch (e) {
      return Left(DataGetFailure(e.error));
    }
  }

  @override
  Future<Either<Failure, String>> addTransaction(AddParam addParm) async {
    try {
      final resp = await transactionDataSource
          .addTransaction(TransactionModel.fromEntity(addParm.transaction));
      return Right(resp);
    } on DataException catch (e) {
      return Left(AddDataFailure(e.error));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions(
      DateParams params) async {
    try {
      List<TransactionEntity> transactionData =
          await transactionDataSource.getTransactions(params);
      return Right(transactionData);
    } on DataException catch (e) {
      return Left(AddDataFailure(e.error));
    }
  }
}
