import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'results_state.freezed.dart';

@freezed
class ResultsState with _$ResultsState {
  const ResultsState._();
  const factory ResultsState({
    required bool isLoading,
    required bool errorStatus,
    required String errorMessage,
    required List<FixtureClass> dataList,
  }) = _ResultsState;

  factory ResultsState.initial() {
    return const ResultsState(
      isLoading: false,
      errorStatus: false,
      errorMessage: "",
      dataList: [],
    );
  }
}