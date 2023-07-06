import 'package:cricket_game_content_app/application/series_state.dart';
import 'package:cricket_game_content_app/data/series_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesNotifier extends StateNotifier<SeriesState> {
  final SeriesRepository _seriesRepo;
  SeriesNotifier(this._seriesRepo) : super(SeriesState.initial());

  Future<void> getSeriesList() async {
    state = state.copyWith(isLoading: true);

    final getListResult = await _seriesRepo.getSeriesDataList();
    getListResult.fold((failure) {
      failure.maybeMap(
        notFound: (_) {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Data not found");
        },
        cancelledOperation: (_) {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Operation cancelled");
        },
        orElse: () {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Unknown error");
        },
      );
    }, (seriesList) {
      var sortedList = seriesList;
      sortedList
          .sort((a, b) => b.latestUpdateDate.compareTo(a.latestUpdateDate));
      state = state.copyWith(
          isLoading: false, errorStatus: false, dataList: sortedList);
    });
  }

  Future<void> getFixturesBySeries(String seriesId) async {
    state = state.copyWith(isLoading: true);

    final getListResult = await _seriesRepo.getFixtureBySeriesDataList(seriesId);
    getListResult.fold((failure) {
      failure.maybeMap(
        notFound: (_) {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Data not found");
        },
        cancelledOperation: (_) {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Operation cancelled");
        },
        orElse: () {
          state = state.copyWith(
              isLoading: false,
              errorStatus: true,
              errorMessage: "Unknown error");
        },
      );
    }, (fixtureList) {
      var sortedList = fixtureList;
      sortedList
          .sort((a, b) => b.fixtureDate.compareTo(a.fixtureDate));
      state = state.copyWith(
          isLoading: false, errorStatus: false, fixtureListBySeries: sortedList);
    });
  }
}
