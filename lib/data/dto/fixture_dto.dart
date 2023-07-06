import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/team_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

part 'fixture_dto.freezed.dart';
part 'fixture_dto.g.dart';

/// Data Transfer Object(DTO) for FixtureClass to facilitate conversion between json and application's data type.
@freezed
class FixtureDTO with _$FixtureDTO {
  const FixtureDTO._();
  const factory FixtureDTO({
    required String fixtureId,
    required String fixtureDate,
    required String matchTitle, 
    required String matchSubTitle,
    required String result,
    required String seriesId,
    required String status,
    required String venue,
    required String home,
    required String away,
  }) = _FixtureDTO;

  FixtureClass fromDTO() {
    List<String> homeStrings = home.split("-");
    List<String> awayStrings = away.split("-");
    return FixtureClass(
      fixtureId: fixtureId,
      fixtureDate: DateTime.parse(fixtureDate), 
      matchTitle: matchTitle, 
      matchSubTitle: matchSubTitle,
      result: result,
      seriesId: seriesId,
      status: status,
      venue: venue,
      home: Team(homeStrings[0], homeStrings[1], homeStrings[2]),
      away: Team(awayStrings[0], awayStrings[1], awayStrings[2]),
    );
  }

  // toJson() created by json_serializable package
  factory FixtureDTO.fromJson(Map<String, Object?> json)
      => _$FixtureDTOFromJson(json);
}