import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class MainCollectionRef {
  @lazySingleton
  CollectionReference get firestore =>
      FirebaseFirestore.instance.collection('FinFlowDataBase');
}
