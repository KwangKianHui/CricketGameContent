// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'series_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get errorStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<SeriesClass> get dataList => throw _privateConstructorUsedError;
  List<FixtureClass> get fixtureListBySeries =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeriesStateCopyWith<SeriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesStateCopyWith<$Res> {
  factory $SeriesStateCopyWith(
          SeriesState value, $Res Function(SeriesState) then) =
      _$SeriesStateCopyWithImpl<$Res, SeriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool errorStatus,
      String errorMessage,
      List<SeriesClass> dataList,
      List<FixtureClass> fixtureListBySeries});
}

/// @nodoc
class _$SeriesStateCopyWithImpl<$Res, $Val extends SeriesState>
    implements $SeriesStateCopyWith<$Res> {
  _$SeriesStateCopyWithImpl(this._value, this._then);

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
    Object? fixtureListBySeries = null,
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
              as List<SeriesClass>,
      fixtureListBySeries: null == fixtureListBySeries
          ? _value.fixtureListBySeries
          : fixtureListBySeries // ignore: cast_nullable_to_non_nullable
              as List<FixtureClass>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeriesStateCopyWith<$Res>
    implements $SeriesStateCopyWith<$Res> {
  factory _$$_SeriesStateCopyWith(
          _$_SeriesState value, $Res Function(_$_SeriesState) then) =
      __$$_SeriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool errorStatus,
      String errorMessage,
      List<SeriesClass> dataList,
      List<FixtureClass> fixtureListBySeries});
}

/// @nodoc
class __$$_SeriesStateCopyWithImpl<$Res>
    extends _$SeriesStateCopyWithImpl<$Res, _$_SeriesState>
    implements _$$_SeriesStateCopyWith<$Res> {
  __$$_SeriesStateCopyWithImpl(
      _$_SeriesState _value, $Res Function(_$_SeriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorStatus = null,
    Object? errorMessage = null,
    Object? dataList = null,
    Object? fixtureListBySeries = null,
  }) {
    return _then(_$_SeriesState(
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
              as List<SeriesClass>,
      fixtureListBySeries: null == fixtureListBySeries
          ? _value._fixtureListBySeries
          : fixtureListBySeries // ignore: cast_nullable_to_non_nullable
              as List<FixtureClass>,
    ));
  }
}

/// @nodoc

class _$_SeriesState extends _SeriesState with DiagnosticableTreeMixin {
  const _$_SeriesState(
      {required this.isLoading,
      required this.errorStatus,
      required this.errorMessage,
      required final List<SeriesClass> dataList,
      required final List<FixtureClass> fixtureListBySeries})
      : _dataList = dataList,
        _fixtureListBySeries = fixtureListBySeries,
        super._();

  @override
  final bool isLoading;
  @override
  final bool errorStatus;
  @override
  final String errorMessage;
  final List<SeriesClass> _dataList;
  @override
  List<SeriesClass> get dataList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataList);
  }

  final List<FixtureClass> _fixtureListBySeries;
  @override
  List<FixtureClass> get fixtureListBySeries {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fixtureListBySeries);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesState(isLoading: $isLoading, errorStatus: $errorStatus, errorMessage: $errorMessage, dataList: $dataList, fixtureListBySeries: $fixtureListBySeries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeriesState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorStatus', errorStatus))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('dataList', dataList))
      ..add(DiagnosticsProperty('fixtureListBySeries', fixtureListBySeries));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeriesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorStatus, errorStatus) ||
                other.errorStatus == errorStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._dataList, _dataList) &&
            const DeepCollectionEquality()
                .equals(other._fixtureListBySeries, _fixtureListBySeries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorStatus,
      errorMessage,
      const DeepCollectionEquality().hash(_dataList),
      const DeepCollectionEquality().hash(_fixtureListBySeries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeriesStateCopyWith<_$_SeriesState> get copyWith =>
      __$$_SeriesStateCopyWithImpl<_$_SeriesState>(this, _$identity);
}

abstract class _SeriesState extends SeriesState {
  const factory _SeriesState(
      {required final bool isLoading,
      required final bool errorStatus,
      required final String errorMessage,
      required final List<SeriesClass> dataList,
      required final List<FixtureClass> fixtureListBySeries}) = _$_SeriesState;
  const _SeriesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get errorStatus;
  @override
  String get errorMessage;
  @override
  List<SeriesClass> get dataList;
  @override
  List<FixtureClass> get fixtureListBySeries;
  @override
  @JsonKey(ignore: true)
  _$$_SeriesStateCopyWith<_$_SeriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
