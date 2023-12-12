import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.authError(String error) = AuthError;
  factory Failure.dataGetFailure(String error) = DataGetFailure;
  factory Failure.addDataFailure(String error) = AddDataFailure;
}
