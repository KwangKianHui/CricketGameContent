// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SeriesDTO _$$_SeriesDTOFromJson(Map<String, dynamic> json) => _$_SeriesDTO(
      seriesId: json['seriesId'] as String,
      season: json['season'] as String,
      seriesName: json['seriesName'] as String,
      latestUpdateDate: json['latestUpdateDate'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_SeriesDTOToJson(_$_SeriesDTO instance) =>
    <String, dynamic>{
      'seriesId': instance.seriesId,
      'season': instance.season,
      'seriesName': instance.seriesName,
      'latestUpdateDate': instance.latestUpdateDate,
      'status': instance.status,
      'type': instance.type,
    };
