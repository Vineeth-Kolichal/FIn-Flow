import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_flow/features/home/data/datasources/pdf_api.dart';
import 'package:fin_flow/features/home/data/models/transaction_model.dart';
import 'package:fin_flow/features/home/domain/usecases/add_category_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/delete_transactions_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/generate_report_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:fin_flow/features/home/domain/usecases/get_transactions_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exception.dart';

abstract class TransactionDataSource {
  Future<List<String>> getCategories(Cparams param);
  Future<String> addTransaction(TransactionModel transactionModel);
  Future<List<TransactionModel>> getTransactions(DateParams params);
  Future<String> addCategory(AddCategoryParam param);
  Future<String> deleteTransaction(DeleteParam param);
  Future<String> generatePdf(PdfParam param);
}

@LazySingleton(as: TransactionDataSource)
@injectable
class TransactionsDataSourceImpl implements TransactionDataSource {
  final CollectionReference mainCollectionRef;
  TransactionsDataSourceImpl(this.mainCollectionRef);
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

  @override
  Future<List<TransactionModel>> getTransactions(DateParams params) async {
    try {
      List<TransactionModel> transactionList = [];
      final transactionData = await mainCollectionRef
          .doc(uid)
          .collection('Transactions')
          .where('date', isGreaterThanOrEqualTo: params.fromDate)
          .where('date', isLessThan: params.toDate)
          .get();
      for (var dta in transactionData.docs) {
        Map<String, dynamic> data = dta.data();
        data['id'] = dta.id;
        transactionList.add(TransactionModel.fromMap(data));
      }
      return transactionList.reversed.toList();
    } on FirebaseException catch (e) {
      throw DataException('${e.message}');
    }
  }

  @override
  Future<String> addCategory(AddCategoryParam param) async {
    try {
      await mainCollectionRef
          .doc(uid)
          .collection('Categories')
          .add({"name": param.category, "type": param.type});
      return " '${param.category}' added as ${param.type} category";
    } catch (e) {
      throw DataException(e.toString());
    }
  }

  @override
  Future<String> deleteTransaction(DeleteParam param) async {
    try {
      await mainCollectionRef
          .doc(uid)
          .collection('Transactions')
          .doc(param.id)
          .delete();
      return "Transaction deleted";
    } on FirebaseException catch (e) {
      throw DataException('${e.message}');
    }
  }

  @override
  Future<String> generatePdf(PdfParam param) async {
    try {
      final pdf = await PdfApi.generate(param);
      await PdfApi.openFile(pdf);
      return "Transaction report saved in downloads";
    } catch (e) {
      rethrow;
    }
  }
}
