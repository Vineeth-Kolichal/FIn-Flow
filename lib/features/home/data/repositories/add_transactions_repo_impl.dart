import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/exception.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/features/home/data/datasources/add_transactions_data.dart';
import 'package:fin_flow/features/home/data/models/transaction_model.dart';
import 'package:fin_flow/features/home/domain/repositories/add_transactions_repo.dart';
import 'package:fin_flow/features/home/domain/usecases/add_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddTransactionsRepositories)
@injectable
class AddTransactionsRepoImpl implements AddTransactionsRepositories {
  AddTransactionDataSource addTransactionDataSource;
  AddTransactionsRepoImpl(this.addTransactionDataSource);
  @override
  Future<Either<Failure, List<String>>> getCategories(Cparams params) async {
    try {
      final data = await addTransactionDataSource.getCategories(params);
      return Right(data);
    } on DataException catch (e) {
      return Left(DataGetFailure(e.error));
    }
  }

  @override
  Future<Either<Failure, String>> addTransaction(AddParam addParm) async {
    try {
      final resp = await addTransactionDataSource
          .addTransaction(TransactionModel.fromEntity(addParm.transaction));
      return Right(resp);
    } on DataException catch (e) {
      return Left(AddDataFailure(e.error));
    }
  }
}
