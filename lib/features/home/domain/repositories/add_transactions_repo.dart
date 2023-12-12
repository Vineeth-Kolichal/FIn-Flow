import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/features/home/domain/usecases/add_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';

abstract class AddTransactionsRepositories {
  Future<Either<Failure, List<String>>> getCategories(Cparams params);
  Future<Either<Failure,String>> addTransaction(AddParam addParm);
}
