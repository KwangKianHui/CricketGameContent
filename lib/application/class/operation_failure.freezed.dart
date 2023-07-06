// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'operation_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OperationFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function() cancelledOperation,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function()? cancelledOperation,
    TResult? Function(String errorMessage)? unexpected,
    TResult? Function()? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function()? cancelledOperation,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(CancelledOperation value)? cancelledOperation,
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(NotFound value)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationFailureCopyWith<$Res> {
  factory $OperationFailureCopyWith(
          OperationFailure value, $Res Function(OperationFailure) then) =
      _$OperationFailureCopyWithImpl<$Res, OperationFailure>;
}

/// @nodoc
class _$OperationFailureCopyWithImpl<$Res, $Val extends OperationFailure>
    implements $OperationFailureCopyWith<$Res> {
  _$OperationFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoConnectionCopyWith<$Res> {
  factory _$$NoConnectionCopyWith(
          _$NoConnection value, $Res Function(_$NoConnection) then) =
      __$$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionCopyWithImpl<$Res>
    extends _$OperationFailureCopyWithImpl<$Res, _$NoConnection>
    implements _$$NoConnectionCopyWith<$Res> {
  __$$NoConnectionCopyWithImpl(
      _$NoConnection _value, $Res Function(_$NoConnection) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoConnection extends NoConnection {
  const _$NoConnection() : super._();

  @override
  String toString() {
    return 'OperationFailure.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function() cancelledOperation,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function()? cancelledOperation,
    TResult? Function(String errorMessage)? unexpected,
    TResult? Function()? notFound,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function()? cancelledOperation,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(CancelledOperation value)? cancelledOperation,
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(NotFound value)? notFound,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection extends OperationFailure {
  const factory NoConnection() = _$NoConnection;
  const NoConnection._() : super._();
}

/// @nodoc
abstract class _$$CancelledOperationCopyWith<$Res> {
  factory _$$CancelledOperationCopyWith(_$CancelledOperation value,
          $Res Function(_$CancelledOperation) then) =
      __$$CancelledOperationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledOperationCopyWithImpl<$Res>
    extends _$OperationFailureCopyWithImpl<$Res, _$CancelledOperation>
    implements _$$CancelledOperationCopyWith<$Res> {
  __$$CancelledOperationCopyWithImpl(
      _$CancelledOperation _value, $Res Function(_$CancelledOperation) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelledOperation extends CancelledOperation {
  const _$CancelledOperation() : super._();

  @override
  String toString() {
    return 'OperationFailure.cancelledOperation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelledOperation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function() cancelledOperation,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
  }) {
    return cancelledOperation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function()? cancelledOperation,
    TResult? Function(String errorMessage)? unexpected,
    TResult? Function()? notFound,
  }) {
    return cancelledOperation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function()? cancelledOperation,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (cancelledOperation != null) {
      return cancelledOperation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
  }) {
    return cancelledOperation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(CancelledOperation value)? cancelledOperation,
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(NotFound value)? notFound,
  }) {
    return cancelledOperation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (cancelledOperation != null) {
      return cancelledOperation(this);
    }
    return orElse();
  }
}

abstract class CancelledOperation extends OperationFailure {
  const factory CancelledOperation() = _$CancelledOperation;
  const CancelledOperation._() : super._();
}

/// @nodoc
abstract class _$$UnexpectedCopyWith<$Res> {
  factory _$$UnexpectedCopyWith(
          _$Unexpected value, $Res Function(_$Unexpected) then) =
      __$$UnexpectedCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$UnexpectedCopyWithImpl<$Res>
    extends _$OperationFailureCopyWithImpl<$Res, _$Unexpected>
    implements _$$UnexpectedCopyWith<$Res> {
  __$$UnexpectedCopyWithImpl(
      _$Unexpected _value, $Res Function(_$Unexpected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$Unexpected(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Unexpected extends Unexpected {
  const _$Unexpected(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'OperationFailure.unexpected(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Unexpected &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedCopyWith<_$Unexpected> get copyWith =>
      __$$UnexpectedCopyWithImpl<_$Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function() cancelledOperation,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
  }) {
    return unexpected(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function()? cancelledOperation,
    TResult? Function(String errorMessage)? unexpected,
    TResult? Function()? notFound,
  }) {
    return unexpected?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function()? cancelledOperation,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(CancelledOperation value)? cancelledOperation,
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(NotFound value)? notFound,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected extends OperationFailure {
  const factory Unexpected(final String errorMessage) = _$Unexpected;
  const Unexpected._() : super._();

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$UnexpectedCopyWith<_$Unexpected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundCopyWith<$Res> {
  factory _$$NotFoundCopyWith(
          _$NotFound value, $Res Function(_$NotFound) then) =
      __$$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundCopyWithImpl<$Res>
    extends _$OperationFailureCopyWithImpl<$Res, _$NotFound>
    implements _$$NotFoundCopyWith<$Res> {
  __$$NotFoundCopyWithImpl(_$NotFound _value, $Res Function(_$NotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFound extends NotFound {
  const _$NotFound() : super._();

  @override
  String toString() {
    return 'OperationFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function() cancelledOperation,
    required TResult Function(String errorMessage) unexpected,
    required TResult Function() notFound,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function()? cancelledOperation,
    TResult? Function(String errorMessage)? unexpected,
    TResult? Function()? notFound,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function()? cancelledOperation,
    TResult Function(String errorMessage)? unexpected,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(CancelledOperation value) cancelledOperation,
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(NotFound value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(CancelledOperation value)? cancelledOperation,
    TResult? Function(Unexpected value)? unexpected,
    TResult? Function(NotFound value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoConnection value)? noConnection,
    TResult Function(CancelledOperation value)? cancelledOperation,
    TResult Function(Unexpected value)? unexpected,
    TResult Function(NotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound extends OperationFailure {
  const factory NotFound() = _$NotFound;
  const NotFound._() : super._();
}
