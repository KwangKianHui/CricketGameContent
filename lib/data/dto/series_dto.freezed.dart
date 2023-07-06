// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'series_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeriesDTO _$SeriesDTOFromJson(Map<String, dynamic> json) {
  return _SeriesDTO.fromJson(json);
}

/// @nodoc
mixin _$SeriesDTO {
  String get seriesId => throw _privateConstructorUsedError;
  String get season => throw _privateConstructorUsedError;
  String get seriesName => throw _privateConstructorUsedError;
  String get latestUpdateDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesDTOCopyWith<SeriesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesDTOCopyWith<$Res> {
  factory $SeriesDTOCopyWith(SeriesDTO value, $Res Function(SeriesDTO) then) =
      _$SeriesDTOCopyWithImpl<$Res, SeriesDTO>;
  @useResult
  $Res call(
      {String seriesId,
      String season,
      String seriesName,
      String latestUpdateDate,
      String status,
      String type});
}

/// @nodoc
class _$SeriesDTOCopyWithImpl<$Res, $Val extends SeriesDTO>
    implements $SeriesDTOCopyWith<$Res> {
  _$SeriesDTOCopyWithImpl(this._value, this._then);

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
              as String,
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
abstract class _$$_SeriesDTOCopyWith<$Res> implements $SeriesDTOCopyWith<$Res> {
  factory _$$_SeriesDTOCopyWith(
          _$_SeriesDTO value, $Res Function(_$_SeriesDTO) then) =
      __$$_SeriesDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String seriesId,
      String season,
      String seriesName,
      String latestUpdateDate,
      String status,
      String type});
}

/// @nodoc
class __$$_SeriesDTOCopyWithImpl<$Res>
    extends _$SeriesDTOCopyWithImpl<$Res, _$_SeriesDTO>
    implements _$$_SeriesDTOCopyWith<$Res> {
  __$$_SeriesDTOCopyWithImpl(
      _$_SeriesDTO _value, $Res Function(_$_SeriesDTO) _then)
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
    return _then(_$_SeriesDTO(
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
              as String,
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
@JsonSerializable()
class _$_SeriesDTO extends _SeriesDTO with DiagnosticableTreeMixin {
  const _$_SeriesDTO(
      {required this.seriesId,
      required this.season,
      required this.seriesName,
      required this.latestUpdateDate,
      required this.status,
      required this.type})
      : super._();

  factory _$_SeriesDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SeriesDTOFromJson(json);

  @override
  final String seriesId;
  @override
  final String season;
  @override
  final String seriesName;
  @override
  final String latestUpdateDate;
  @override
  final String status;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeriesDTO(seriesId: $seriesId, season: $season, seriesName: $seriesName, latestUpdateDate: $latestUpdateDate, status: $status, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeriesDTO'))
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
            other is _$_SeriesDTO &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, seriesId, season, seriesName,
      latestUpdateDate, status, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeriesDTOCopyWith<_$_SeriesDTO> get copyWith =>
      __$$_SeriesDTOCopyWithImpl<_$_SeriesDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeriesDTOToJson(
      this,
    );
  }
}

abstract class _SeriesDTO extends SeriesDTO {
  const factory _SeriesDTO(
      {required final String seriesId,
      required final String season,
      required final String seriesName,
      required final String latestUpdateDate,
      required final String status,
      required final String type}) = _$_SeriesDTO;
  const _SeriesDTO._() : super._();

  factory _SeriesDTO.fromJson(Map<String, dynamic> json) =
      _$_SeriesDTO.fromJson;

  @override
  String get seriesId;
  @override
  String get season;
  @override
  String get seriesName;
  @override
  String get latestUpdateDate;
  @override
  String get status;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_SeriesDTOCopyWith<_$_SeriesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
