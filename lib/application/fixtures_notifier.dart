import 'package:cricket_game_content_app/application/fixtures_state.dart';
import 'package:cricket_game_content_app/data/fixtures_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixturesNotifier extends StateNotifier<FixturesState> {
  final FixturesRepository _fixturesRepo;
  FixturesNotifier(this._fixturesRepo) : super(FixturesState.initial());

  Future<void> getNext50FixturesDataList() async {
    state = state.copyWith(isLoading: true);

    final getListResult = await _fixturesRepo.getNext50FixturesDataList();
    getListResult.fold((failure) {
      failure.maybeMap(
        // notFound: (_) {
        //   state = state.copyWith(
        //       isLoading: false,
        //       errorStatus: true,
        //       errorMessage: "Data not found");
        // },
        // cancelledOperation: (_) {
        //   state = state.copyWith(
        //       isLoading: false,
        //       errorStatus: true,
        //       errorMessage: "Operation cancelled");
        // },
        orElse: () {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Unknown error");
        },
      );
    }, (fixturesList) {
     // unlike series, no date sorting as response will return the closest fixture to the furthest fixture in terms of date.
      state = state.copyWith(
          isLoading: false, errorStatus: false, dataList: fixturesList);
    });
  }

  Future<void> getFixtureListByDate(String date) async {
    state = state.copyWith(isLoading: true);

    final getListResult = await _fixturesRepo.getFixtureListByDate(date);
    getListResult.fold((failure) {
      failure.maybeMap(
        // notFound: (_) {
        //   state = state.copyWith(
        //       isLoading: false,
        //       errorStatus: true,
        //       errorMessage: "Data not found");
        // },
        // cancelledOperation: (_) {
        //   state = state.copyWith(
        //       isLoading: false,
        //       errorStatus: true,
        //       errorMessage: "Operation cancelled");
        // },
        orElse: () {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Unknown error");
        },
      );
    }, (fixtureList) {
      state = state.copyWith(
          isLoading: false, errorStatus: false, dataList: fixtureList);
    });
  }
}
