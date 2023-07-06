import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'series_state.freezed.dart';

@freezed
class SeriesState with _$SeriesState {
  const SeriesState._();
  const factory SeriesState({
    required bool isLoading,
    required bool errorStatus,
    required String errorMessage,
    required List<SeriesClass> dataList,
    required List<FixtureClass> fixtureListBySeries,
  }) = _SeriesState;

  factory SeriesState.initial() {
    return const SeriesState(
      isLoading: false,
      errorStatus: false,
      errorMessage: "",
      dataList: [],
      fixtureListBySeries: []
    );
  }
}