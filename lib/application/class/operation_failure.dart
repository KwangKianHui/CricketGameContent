import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_failure.freezed.dart';

@freezed
class OperationFailure with _$OperationFailure {
  const OperationFailure._();
  const factory OperationFailure.noConnection() = NoConnection;
  const factory OperationFailure.cancelledOperation() = CancelledOperation;
  const factory OperationFailure.unexpected(String errorMessage) = Unexpected;
  const factory OperationFailure.notFound() = NotFound;
}