import 'package:cricket_game_content_app/application/results_state.dart';
import 'package:cricket_game_content_app/data/results_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultsNotifier extends StateNotifier<ResultsState> {
  final ResultsRepository _resultsRepo;
  ResultsNotifier(this._resultsRepo) : super(ResultsState.initial());

  Future<void> getLast50ResultsDataList() async {
    state = state.copyWith(isLoading: true);

    final getListResult = await _resultsRepo.getLast50ResultsDataList();
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

  Future<void> getResultListByDate(String date) async {
    state = state.copyWith(isLoading: true);

    final getListResult = await _resultsRepo.getResultListByDate(date);
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
    }, (resultList) {
      state = state.copyWith(
          isLoading: false, errorStatus: false, dataList: resultList);
    });
  }
}
