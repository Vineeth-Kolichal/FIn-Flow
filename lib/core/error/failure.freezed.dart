// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) authError,
    required TResult Function(String error) dataGetFailure,
    required TResult Function(String error) addDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? authError,
    TResult? Function(String error)? dataGetFailure,
    TResult? Function(String error)? addDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? authError,
    TResult Function(String error)? dataGetFailure,
    TResult Function(String error)? addDataFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthError value) authError,
    required TResult Function(DataGetFailure value) dataGetFailure,
    required TResult Function(AddDataFailure value) addDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthError value)? authError,
    TResult? Function(DataGetFailure value)? dataGetFailure,
    TResult? Function(AddDataFailure value)? addDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthError value)? authError,
    TResult Function(DataGetFailure value)? dataGetFailure,
    TResult Function(AddDataFailure value)? addDataFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AuthErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  _$AuthErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.authError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) authError,
    required TResult Function(String error) dataGetFailure,
    required TResult Function(String error) addDataFailure,
  }) {
    return authError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? authError,
    TResult? Function(String error)? dataGetFailure,
    TResult? Function(String error)? addDataFailure,
  }) {
    return authError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? authError,
    TResult Function(String error)? dataGetFailure,
    TResult Function(String error)? addDataFailure,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthError value) authError,
    required TResult Function(DataGetFailure value) dataGetFailure,
    required TResult Function(AddDataFailure value) addDataFailure,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthError value)? authError,
    TResult? Function(DataGetFailure value)? dataGetFailure,
    TResult? Function(AddDataFailure value)? addDataFailure,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthError value)? authError,
    TResult Function(DataGetFailure value)? dataGetFailure,
    TResult Function(AddDataFailure value)? addDataFailure,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class AuthError implements Failure {
  factory AuthError(final String error) = _$AuthErrorImpl;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataGetFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$DataGetFailureImplCopyWith(_$DataGetFailureImpl value,
          $Res Function(_$DataGetFailureImpl) then) =
      __$$DataGetFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DataGetFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$DataGetFailureImpl>
    implements _$$DataGetFailureImplCopyWith<$Res> {
  __$$DataGetFailureImplCopyWithImpl(
      _$DataGetFailureImpl _value, $Res Function(_$DataGetFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DataGetFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataGetFailureImpl implements DataGetFailure {
  _$DataGetFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.dataGetFailure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataGetFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataGetFailureImplCopyWith<_$DataGetFailureImpl> get copyWith =>
      __$$DataGetFailureImplCopyWithImpl<_$DataGetFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) authError,
    required TResult Function(String error) dataGetFailure,
    required TResult Function(String error) addDataFailure,
  }) {
    return dataGetFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? authError,
    TResult? Function(String error)? dataGetFailure,
    TResult? Function(String error)? addDataFailure,
  }) {
    return dataGetFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? authError,
    TResult Function(String error)? dataGetFailure,
    TResult Function(String error)? addDataFailure,
    required TResult orElse(),
  }) {
    if (dataGetFailure != null) {
      return dataGetFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthError value) authError,
    required TResult Function(DataGetFailure value) dataGetFailure,
    required TResult Function(AddDataFailure value) addDataFailure,
  }) {
    return dataGetFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthError value)? authError,
    TResult? Function(DataGetFailure value)? dataGetFailure,
    TResult? Function(AddDataFailure value)? addDataFailure,
  }) {
    return dataGetFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthError value)? authError,
    TResult Function(DataGetFailure value)? dataGetFailure,
    TResult Function(AddDataFailure value)? addDataFailure,
    required TResult orElse(),
  }) {
    if (dataGetFailure != null) {
      return dataGetFailure(this);
    }
    return orElse();
  }
}

abstract class DataGetFailure implements Failure {
  factory DataGetFailure(final String error) = _$DataGetFailureImpl;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$DataGetFailureImplCopyWith<_$DataGetFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddDataFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AddDataFailureImplCopyWith(_$AddDataFailureImpl value,
          $Res Function(_$AddDataFailureImpl) then) =
      __$$AddDataFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AddDataFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AddDataFailureImpl>
    implements _$$AddDataFailureImplCopyWith<$Res> {
  __$$AddDataFailureImplCopyWithImpl(
      _$AddDataFailureImpl _value, $Res Function(_$AddDataFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AddDataFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddDataFailureImpl implements AddDataFailure {
  _$AddDataFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.addDataFailure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDataFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDataFailureImplCopyWith<_$AddDataFailureImpl> get copyWith =>
      __$$AddDataFailureImplCopyWithImpl<_$AddDataFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) authError,
    required TResult Function(String error) dataGetFailure,
    required TResult Function(String error) addDataFailure,
  }) {
    return addDataFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? authError,
    TResult? Function(String error)? dataGetFailure,
    TResult? Function(String error)? addDataFailure,
  }) {
    return addDataFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? authError,
    TResult Function(String error)? dataGetFailure,
    TResult Function(String error)? addDataFailure,
    required TResult orElse(),
  }) {
    if (addDataFailure != null) {
      return addDataFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthError value) authError,
    required TResult Function(DataGetFailure value) dataGetFailure,
    required TResult Function(AddDataFailure value) addDataFailure,
  }) {
    return addDataFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthError value)? authError,
    TResult? Function(DataGetFailure value)? dataGetFailure,
    TResult? Function(AddDataFailure value)? addDataFailure,
  }) {
    return addDataFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthError value)? authError,
    TResult Function(DataGetFailure value)? dataGetFailure,
    TResult Function(AddDataFailure value)? addDataFailure,
    required TResult orElse(),
  }) {
    if (addDataFailure != null) {
      return addDataFailure(this);
    }
    return orElse();
  }
}

abstract class AddDataFailure implements Failure {
  factory AddDataFailure(final String error) = _$AddDataFailureImpl;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$AddDataFailureImplCopyWith<_$AddDataFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
