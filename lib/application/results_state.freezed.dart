// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'results_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get errorStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<FixtureClass> get dataList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultsStateCopyWith<ResultsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsStateCopyWith<$Res> {
  factory $ResultsStateCopyWith(
          ResultsState value, $Res Function(ResultsState) then) =
      _$ResultsStateCopyWithImpl<$Res, ResultsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool errorStatus,
      String errorMessage,
      List<FixtureClass> dataList});
}

/// @nodoc
class _$ResultsStateCopyWithImpl<$Res, $Val extends ResultsState>
    implements $ResultsStateCopyWith<$Res> {
  _$ResultsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorStatus = null,
    Object? errorMessage = null,
    Object? dataList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorStatus: null == errorStatus
          ? _value.errorStatus
          : errorStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      dataList: null == dataList
          ? _value.dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<FixtureClass>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultsStateCopyWith<$Res>
    implements $ResultsStateCopyWith<$Res> {
  factory _$$_ResultsStateCopyWith(
          _$_ResultsState value, $Res Function(_$_ResultsState) then) =
      __$$_ResultsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool errorStatus,
      String errorMessage,
      List<FixtureClass> dataList});
}

/// @nodoc
class __$$_ResultsStateCopyWithImpl<$Res>
    extends _$ResultsStateCopyWithImpl<$Res, _$_ResultsState>
    implements _$$_ResultsStateCopyWith<$Res> {
  __$$_ResultsStateCopyWithImpl(
      _$_ResultsState _value, $Res Function(_$_ResultsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorStatus = null,
    Object? errorMessage = null,
    Object? dataList = null,
  }) {
    return _then(_$_ResultsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorStatus: null == errorStatus
          ? _value.errorStatus
          : errorStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      dataList: null == dataList
          ? _value._dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<FixtureClass>,
    ));
  }
}

/// @nodoc

class _$_ResultsState extends _ResultsState with DiagnosticableTreeMixin {
  const _$_ResultsState(
      {required this.isLoading,
      required this.errorStatus,
      required this.errorMessage,
      required final List<FixtureClass> dataList})
      : _dataList = dataList,
        super._();

  @override
  final bool isLoading;
  @override
  final bool errorStatus;
  @override
  final String errorMessage;
  final List<FixtureClass> _dataList;
  @override
  List<FixtureClass> get dataList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResultsState(isLoading: $isLoading, errorStatus: $errorStatus, errorMessage: $errorMessage, dataList: $dataList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResultsState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorStatus', errorStatus))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('dataList', dataList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorStatus, errorStatus) ||
                other.errorStatus == errorStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._dataList, _dataList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorStatus,
      errorMessage, const DeepCollectionEquality().hash(_dataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultsStateCopyWith<_$_ResultsState> get copyWith =>
      __$$_ResultsStateCopyWithImpl<_$_ResultsState>(this, _$identity);
}

abstract class _ResultsState extends ResultsState {
  const factory _ResultsState(
      {required final bool isLoading,
      required final bool errorStatus,
      required final String errorMessage,
      required final List<FixtureClass> dataList}) = _$_ResultsState;
  const _ResultsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get errorStatus;
  @override
  String get errorMessage;
  @override
  List<FixtureClass> get dataList;
  @override
  @JsonKey(ignore: true)
  _$$_ResultsStateCopyWith<_$_ResultsState> get copyWith =>
      throw _privateConstructorUsedError;
}
