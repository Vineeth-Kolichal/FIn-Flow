// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime fromDate, DateTime toDate)
        getTransactions,
    required TResult Function(TransactionEntity entity) deleteTransaction,
    required TResult Function(List<TransactionEntity> transactions)
        generateReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult? Function(TransactionEntity entity)? deleteTransaction,
    TResult? Function(List<TransactionEntity> transactions)? generateReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult Function(TransactionEntity entity)? deleteTransaction,
    TResult Function(List<TransactionEntity> transactions)? generateReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransactions value) getTransactions,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(GenerateReport value) generateReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransactions value)? getTransactions,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(GenerateReport value)? generateReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransactions value)? getTransactions,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(GenerateReport value)? generateReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenEventCopyWith<$Res> {
  factory $HomeScreenEventCopyWith(
          HomeScreenEvent value, $Res Function(HomeScreenEvent) then) =
      _$HomeScreenEventCopyWithImpl<$Res, HomeScreenEvent>;
}

/// @nodoc
class _$HomeScreenEventCopyWithImpl<$Res, $Val extends HomeScreenEvent>
    implements $HomeScreenEventCopyWith<$Res> {
  _$HomeScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetTransactionsImplCopyWith<$Res> {
  factory _$$GetTransactionsImplCopyWith(_$GetTransactionsImpl value,
          $Res Function(_$GetTransactionsImpl) then) =
      __$$GetTransactionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime fromDate, DateTime toDate});
}

/// @nodoc
class __$$GetTransactionsImplCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res, _$GetTransactionsImpl>
    implements _$$GetTransactionsImplCopyWith<$Res> {
  __$$GetTransactionsImplCopyWithImpl(
      _$GetTransactionsImpl _value, $Res Function(_$GetTransactionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromDate = null,
    Object? toDate = null,
  }) {
    return _then(_$GetTransactionsImpl(
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetTransactionsImpl implements GetTransactions {
  const _$GetTransactionsImpl({required this.fromDate, required this.toDate});

  @override
  final DateTime fromDate;
  @override
  final DateTime toDate;

  @override
  String toString() {
    return 'HomeScreenEvent.getTransactions(fromDate: $fromDate, toDate: $toDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTransactionsImpl &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromDate, toDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTransactionsImplCopyWith<_$GetTransactionsImpl> get copyWith =>
      __$$GetTransactionsImplCopyWithImpl<_$GetTransactionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime fromDate, DateTime toDate)
        getTransactions,
    required TResult Function(TransactionEntity entity) deleteTransaction,
    required TResult Function(List<TransactionEntity> transactions)
        generateReport,
  }) {
    return getTransactions(fromDate, toDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult? Function(TransactionEntity entity)? deleteTransaction,
    TResult? Function(List<TransactionEntity> transactions)? generateReport,
  }) {
    return getTransactions?.call(fromDate, toDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult Function(TransactionEntity entity)? deleteTransaction,
    TResult Function(List<TransactionEntity> transactions)? generateReport,
    required TResult orElse(),
  }) {
    if (getTransactions != null) {
      return getTransactions(fromDate, toDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransactions value) getTransactions,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(GenerateReport value) generateReport,
  }) {
    return getTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransactions value)? getTransactions,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(GenerateReport value)? generateReport,
  }) {
    return getTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransactions value)? getTransactions,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(GenerateReport value)? generateReport,
    required TResult orElse(),
  }) {
    if (getTransactions != null) {
      return getTransactions(this);
    }
    return orElse();
  }
}

abstract class GetTransactions implements HomeScreenEvent {
  const factory GetTransactions(
      {required final DateTime fromDate,
      required final DateTime toDate}) = _$GetTransactionsImpl;

  DateTime get fromDate;
  DateTime get toDate;
  @JsonKey(ignore: true)
  _$$GetTransactionsImplCopyWith<_$GetTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTransactionImplCopyWith<$Res> {
  factory _$$DeleteTransactionImplCopyWith(_$DeleteTransactionImpl value,
          $Res Function(_$DeleteTransactionImpl) then) =
      __$$DeleteTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionEntity entity});
}

/// @nodoc
class __$$DeleteTransactionImplCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res, _$DeleteTransactionImpl>
    implements _$$DeleteTransactionImplCopyWith<$Res> {
  __$$DeleteTransactionImplCopyWithImpl(_$DeleteTransactionImpl _value,
      $Res Function(_$DeleteTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$DeleteTransactionImpl(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as TransactionEntity,
    ));
  }
}

/// @nodoc

class _$DeleteTransactionImpl implements DeleteTransaction {
  const _$DeleteTransactionImpl({required this.entity});

  @override
  final TransactionEntity entity;

  @override
  String toString() {
    return 'HomeScreenEvent.deleteTransaction(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTransactionImpl &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTransactionImplCopyWith<_$DeleteTransactionImpl> get copyWith =>
      __$$DeleteTransactionImplCopyWithImpl<_$DeleteTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime fromDate, DateTime toDate)
        getTransactions,
    required TResult Function(TransactionEntity entity) deleteTransaction,
    required TResult Function(List<TransactionEntity> transactions)
        generateReport,
  }) {
    return deleteTransaction(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult? Function(TransactionEntity entity)? deleteTransaction,
    TResult? Function(List<TransactionEntity> transactions)? generateReport,
  }) {
    return deleteTransaction?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult Function(TransactionEntity entity)? deleteTransaction,
    TResult Function(List<TransactionEntity> transactions)? generateReport,
    required TResult orElse(),
  }) {
    if (deleteTransaction != null) {
      return deleteTransaction(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransactions value) getTransactions,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(GenerateReport value) generateReport,
  }) {
    return deleteTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransactions value)? getTransactions,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(GenerateReport value)? generateReport,
  }) {
    return deleteTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransactions value)? getTransactions,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(GenerateReport value)? generateReport,
    required TResult orElse(),
  }) {
    if (deleteTransaction != null) {
      return deleteTransaction(this);
    }
    return orElse();
  }
}

abstract class DeleteTransaction implements HomeScreenEvent {
  const factory DeleteTransaction({required final TransactionEntity entity}) =
      _$DeleteTransactionImpl;

  TransactionEntity get entity;
  @JsonKey(ignore: true)
  _$$DeleteTransactionImplCopyWith<_$DeleteTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateReportImplCopyWith<$Res> {
  factory _$$GenerateReportImplCopyWith(_$GenerateReportImpl value,
          $Res Function(_$GenerateReportImpl) then) =
      __$$GenerateReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionEntity> transactions});
}

/// @nodoc
class __$$GenerateReportImplCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res, _$GenerateReportImpl>
    implements _$$GenerateReportImplCopyWith<$Res> {
  __$$GenerateReportImplCopyWithImpl(
      _$GenerateReportImpl _value, $Res Function(_$GenerateReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$GenerateReportImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$GenerateReportImpl implements GenerateReport {
  const _$GenerateReportImpl(
      {required final List<TransactionEntity> transactions})
      : _transactions = transactions;

  final List<TransactionEntity> _transactions;
  @override
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'HomeScreenEvent.generateReport(transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateReportImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateReportImplCopyWith<_$GenerateReportImpl> get copyWith =>
      __$$GenerateReportImplCopyWithImpl<_$GenerateReportImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime fromDate, DateTime toDate)
        getTransactions,
    required TResult Function(TransactionEntity entity) deleteTransaction,
    required TResult Function(List<TransactionEntity> transactions)
        generateReport,
  }) {
    return generateReport(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult? Function(TransactionEntity entity)? deleteTransaction,
    TResult? Function(List<TransactionEntity> transactions)? generateReport,
  }) {
    return generateReport?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime fromDate, DateTime toDate)? getTransactions,
    TResult Function(TransactionEntity entity)? deleteTransaction,
    TResult Function(List<TransactionEntity> transactions)? generateReport,
    required TResult orElse(),
  }) {
    if (generateReport != null) {
      return generateReport(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransactions value) getTransactions,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(GenerateReport value) generateReport,
  }) {
    return generateReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransactions value)? getTransactions,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(GenerateReport value)? generateReport,
  }) {
    return generateReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransactions value)? getTransactions,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(GenerateReport value)? generateReport,
    required TResult orElse(),
  }) {
    if (generateReport != null) {
      return generateReport(this);
    }
    return orElse();
  }
}

abstract class GenerateReport implements HomeScreenEvent {
  const factory GenerateReport(
          {required final List<TransactionEntity> transactions}) =
      _$GenerateReportImpl;

  List<TransactionEntity> get transactions;
  @JsonKey(ignore: true)
  _$$GenerateReportImplCopyWith<_$GenerateReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeScreenState {
  List<TransactionEntity> get transactionList =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get dSuccess => throw _privateConstructorUsedError;
  String? get dErr => throw _privateConstructorUsedError;
  String? get pdfMsg => throw _privateConstructorUsedError;
  bool? get isPdfError => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get todDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res, HomeScreenState>;
  @useResult
  $Res call(
      {List<TransactionEntity> transactionList,
      String? error,
      bool isLoading,
      String? dSuccess,
      String? dErr,
      String? pdfMsg,
      bool? isPdfError,
      DateTime? fromDate,
      DateTime? todDate});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res, $Val extends HomeScreenState>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionList = null,
    Object? error = freezed,
    Object? isLoading = null,
    Object? dSuccess = freezed,
    Object? dErr = freezed,
    Object? pdfMsg = freezed,
    Object? isPdfError = freezed,
    Object? fromDate = freezed,
    Object? todDate = freezed,
  }) {
    return _then(_value.copyWith(
      transactionList: null == transactionList
          ? _value.transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dSuccess: freezed == dSuccess
          ? _value.dSuccess
          : dSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      dErr: freezed == dErr
          ? _value.dErr
          : dErr // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfMsg: freezed == pdfMsg
          ? _value.pdfMsg
          : pdfMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      isPdfError: freezed == isPdfError
          ? _value.isPdfError
          : isPdfError // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      todDate: freezed == todDate
          ? _value.todDate
          : todDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionEntity> transactionList,
      String? error,
      bool isLoading,
      String? dSuccess,
      String? dErr,
      String? pdfMsg,
      bool? isPdfError,
      DateTime? fromDate,
      DateTime? todDate});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionList = null,
    Object? error = freezed,
    Object? isLoading = null,
    Object? dSuccess = freezed,
    Object? dErr = freezed,
    Object? pdfMsg = freezed,
    Object? isPdfError = freezed,
    Object? fromDate = freezed,
    Object? todDate = freezed,
  }) {
    return _then(_$InitialImpl(
      transactionList: null == transactionList
          ? _value._transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dSuccess: freezed == dSuccess
          ? _value.dSuccess
          : dSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      dErr: freezed == dErr
          ? _value.dErr
          : dErr // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfMsg: freezed == pdfMsg
          ? _value.pdfMsg
          : pdfMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      isPdfError: freezed == isPdfError
          ? _value.isPdfError
          : isPdfError // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      todDate: freezed == todDate
          ? _value.todDate
          : todDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<TransactionEntity> transactionList,
      required this.error,
      required this.isLoading,
      required this.dSuccess,
      required this.dErr,
      required this.pdfMsg,
      required this.isPdfError,
      required this.fromDate,
      required this.todDate})
      : _transactionList = transactionList;

  final List<TransactionEntity> _transactionList;
  @override
  List<TransactionEntity> get transactionList {
    if (_transactionList is EqualUnmodifiableListView) return _transactionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionList);
  }

  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final String? dSuccess;
  @override
  final String? dErr;
  @override
  final String? pdfMsg;
  @override
  final bool? isPdfError;
  @override
  final DateTime? fromDate;
  @override
  final DateTime? todDate;

  @override
  String toString() {
    return 'HomeScreenState(transactionList: $transactionList, error: $error, isLoading: $isLoading, dSuccess: $dSuccess, dErr: $dErr, pdfMsg: $pdfMsg, isPdfError: $isPdfError, fromDate: $fromDate, todDate: $todDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._transactionList, _transactionList) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.dSuccess, dSuccess) ||
                other.dSuccess == dSuccess) &&
            (identical(other.dErr, dErr) || other.dErr == dErr) &&
            (identical(other.pdfMsg, pdfMsg) || other.pdfMsg == pdfMsg) &&
            (identical(other.isPdfError, isPdfError) ||
                other.isPdfError == isPdfError) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.todDate, todDate) || other.todDate == todDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionList),
      error,
      isLoading,
      dSuccess,
      dErr,
      pdfMsg,
      isPdfError,
      fromDate,
      todDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements HomeScreenState {
  const factory _Initial(
      {required final List<TransactionEntity> transactionList,
      required final String? error,
      required final bool isLoading,
      required final String? dSuccess,
      required final String? dErr,
      required final String? pdfMsg,
      required final bool? isPdfError,
      required final DateTime? fromDate,
      required final DateTime? todDate}) = _$InitialImpl;

  @override
  List<TransactionEntity> get transactionList;
  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  String? get dSuccess;
  @override
  String? get dErr;
  @override
  String? get pdfMsg;
  @override
  bool? get isPdfError;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get todDate;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
