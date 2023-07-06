import 'package:cricket_game_content_app/application/class/team_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'fixture_class.freezed.dart';

@freezed
class FixtureClass with _$FixtureClass {
  const factory FixtureClass({
    required String fixtureId,
    required DateTime fixtureDate,
    required String matchTitle, 
    required String matchSubTitle,
    required String result,
    required String seriesId,
    required String status,
    required String venue,
    required Team home,
    required Team away,
  }) = _FixtureClass;
}