// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FixtureDTO _$$_FixtureDTOFromJson(Map<String, dynamic> json) =>
    _$_FixtureDTO(
      fixtureId: json['fixtureId'] as String,
      fixtureDate: json['fixtureDate'] as String,
      matchTitle: json['matchTitle'] as String,
      matchSubTitle: json['matchSubTitle'] as String,
      result: json['result'] as String,
      seriesId: json['seriesId'] as String,
      status: json['status'] as String,
      venue: json['venue'] as String,
      home: json['home'] as String,
      away: json['away'] as String,
    );

Map<String, dynamic> _$$_FixtureDTOToJson(_$_FixtureDTO instance) =>
    <String, dynamic>{
      'fixtureId': instance.fixtureId,
      'fixtureDate': instance.fixtureDate,
      'matchTitle': instance.matchTitle,
      'matchSubTitle': instance.matchSubTitle,
      'result': instance.result,
      'seriesId': instance.seriesId,
      'status': instance.status,
      'venue': instance.venue,
      'home': instance.home,
      'away': instance.away,
    };
