// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'series_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeriesClass {
  String get seriesId => throw _privateConstructorUsedError;
  String get season => throw _privateConstructorUsedError;
  String get seriesName => throw _privateConstructorUsedError;
  DateTime get latestUpdateDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeriesClassCopyWith<SeriesClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesClassCopyWith<$Res> {
  factory $SeriesClassCopyWith(
          SeriesClass value, $Res Function(SeriesClass) then) =
      _$SeriesClassCopyWithImpl<$Res, SeriesClass>;
  @useResult
  $Res call(
      {String seriesId,
      String season,
      String seriesName,
      DateTime latestUpdateDate,
      String status,
      String type});
}

/// @nodoc
class _$SeriesClassCopyWithImpl<$Res, $Val extends SeriesClass>
    implements $SeriesClassCopyWith<$Res> {
  _$SeriesClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriesId = null,
    Object? season = null,
    Object? seriesName = null,
    Object? latestUpdateDate = null,
    Object? status = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      seriesId: null == seriesId
          ? _value.seriesId
          : seriesId // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      seriesName: null == seriesName
          ? _value.seriesName
          : seriesName // ignore: cast_nullable_to_non_nullable
              as String,
      latestUpdateDate: null == latestUpdateDate
          ? _value.latestUpdateDate
          : latestUpdateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeriesClassCopyWith<$Res>
    implements $SeriesClassCopyWith<$Res> {
  factory _$$_SeriesClassCopyWith(
          _$_SeriesClass value, $Res Function(_$_SeriesClass) then) =
      __$$_SeriesClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String seriesId,
      String season,
      String seriesName,
      DateTime latestUpdateDate,
      String status,
      String type});
}

/// @nodoc
class __$$_SeriesClassCopyWithImpl<$Res>
    extends _$SeriesClassCopyWithImpl<$Res, _$_SeriesClass>
    implements _$$_SeriesClassCopyWith<$Res> {
  __$$_SeriesClassCopyWithImpl(
      _$_SeriesClass _value, $Res Function(_$_SeriesClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriesId = null,
    Object? season = null,
    Object? seriesName = null,
    Object? latestUpdateDate = null,
    Object? status = null,
    Object? type = null,
  }) {
    return _then(_$_SeriesClass(
      seriesId: null == seriesId
          ? _value.seriesId
          : seriesId // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      seriesName: null == seriesName
          ? _value.seriesName
          : seriesName // ignore: cast_nullable_to_non_nullable
              as String,
      latestUpdateDate: null == latestUpdateDate
          ? _value.latestUpdateDate
          : latestUpdateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SeriesClass with DiagnosticableTreeMixin implements _SeriesClass {
  const _$_SeriesClass(
      {required this.seriesId,
      required this.season,
      required this.seriesName,
      required this.latestUpdateDate,
      required this.status,
      required this.type});

  @override
  final String seriesId;
  @override
  final String season;
  @override
  final String seriesName;
  @override
  final DateTime latestUpdateDate;
  @override
  final String status;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesClass(seriesId: $seriesId, season: $season, seriesName: $seriesName, latestUpdateDate: $latestUpdateDate, status: $status, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeriesClass'))
      ..add(DiagnosticsProperty('seriesId', seriesId))
      ..add(DiagnosticsProperty('season', season))
      ..add(DiagnosticsProperty('seriesName', seriesName))
      ..add(DiagnosticsProperty('latestUpdateDate', latestUpdateDate))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeriesClass &&
            (identical(other.seriesId, seriesId) ||
                other.seriesId == seriesId) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.seriesName, seriesName) ||
                other.seriesName == seriesName) &&
            (identical(other.latestUpdateDate, latestUpdateDate) ||
                other.latestUpdateDate == latestUpdateDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seriesId, season, seriesName,
      latestUpdateDate, status, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeriesClassCopyWith<_$_SeriesClass> get copyWith =>
      __$$_SeriesClassCopyWithImpl<_$_SeriesClass>(this, _$identity);
}

abstract class _SeriesClass implements SeriesClass {
  const factory _SeriesClass(
      {required final String seriesId,
      required final String season,
      required final String seriesName,
      required final DateTime latestUpdateDate,
      required final String status,
      required final String type}) = _$_SeriesClass;

  @override
  String get seriesId;
  @override
  String get season;
  @override
  String get seriesName;
  @override
  DateTime get latestUpdateDate;
  @override
  String get status;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_SeriesClassCopyWith<_$_SeriesClass> get copyWith =>
      throw _privateConstructorUsedError;
}
