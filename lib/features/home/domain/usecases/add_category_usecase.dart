import 'package:dartz/dartz.dart';
import 'package:fin_flow/core/error/failure.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/home/domain/repositories/transactions_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class AddCategoryUseCase implements UseCase<String, AddCategoryParam> {
  TransactionsRepositories transactionsRepositories;
  AddCategoryUseCase(this.transactionsRepositories);
  @override
  Future<Either<Failure, String>> call(AddCategoryParam params) {
    return transactionsRepositories.addCategory(params);
  }
}

class AddCategoryParam {
  final String category;
  final String type;

  AddCategoryParam({required this.category, required this.type});
}
