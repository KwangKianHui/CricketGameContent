import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'fixtures_state.freezed.dart';

@freezed
class FixturesState with _$FixturesState {
  const FixturesState._();
  const factory FixturesState({
    required bool isLoading,
    required bool errorStatus,
    required String errorMessage,
    required List<FixtureClass> dataList,
  }) = _FixturesState;

  factory FixturesState.initial() {
    return const FixturesState(
      isLoading: false,
      errorStatus: false,
      errorMessage: "",
      dataList: [],
    );
  }
}