import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_flow/features/home/data/models/transaction_model.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exception.dart';

abstract class AddTransactionDataSource {
  Future<List<String>> getCategories(Cparams param);
  Future<String> addTransaction(TransactionModel transactionModel);
}

@LazySingleton(as: AddTransactionDataSource)
@injectable
class AddTransactionsDataSourceImpl implements AddTransactionDataSource {
  final CollectionReference mainCollectionRef;
  AddTransactionsDataSourceImpl(this.mainCollectionRef);
  static final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<List<String>> getCategories(Cparams param) async {
    List<String> result = [];
    try {
      final datas = await mainCollectionRef
          .doc(uid)
          .collection('Categories')
          .where('type', isEqualTo: param.type)
          .get();
      for (var dta in datas.docs) {
        result.add(dta.data()['name']);
      }
      return result;
    } catch (e) {
      throw DataException(e.toString());
    }
  }

  @override
  Future<String> addTransaction(TransactionModel transactionModel) async {
    try {
      final docRef = await mainCollectionRef
          .doc(uid)
          .collection('Transactions')
          .add(transactionModel.toMap());
      return "Added successfully with id : ${docRef.id}";
    } on FirebaseException catch (e) {
      throw DataException('${e.message}');
    }
  }
}
