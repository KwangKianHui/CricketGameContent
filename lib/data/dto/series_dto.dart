import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

part 'series_dto.freezed.dart';
part 'series_dto.g.dart';

/// Data Transfer Object(DTO) for SeriesClass to facilitate conversion between json and application's data type.
@freezed
class SeriesDTO with _$SeriesDTO {
  const SeriesDTO._();
  const factory SeriesDTO({
    required String seriesId,
    required String season, 
    required String seriesName, 
    required String latestUpdateDate,
    required String status,
    required String type,
  }) = _SeriesDTO;

  SeriesClass fromDTO() {
    return SeriesClass(
      seriesId: seriesId,
      latestUpdateDate: DateTime.parse(latestUpdateDate), 
      season: season, 
      seriesName: seriesName,
      status: status,
      type: type,
    );
  }

  // toJson() created by json_serializable package
  factory SeriesDTO.fromJson(Map<String, Object?> json)
      => _$SeriesDTOFromJson(json);
}