import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:cricket_game_content_app/application/fixtures_notifier.dart';
import 'package:cricket_game_content_app/application/fixtures_state.dart';
import 'package:cricket_game_content_app/application/results_notifier.dart';
import 'package:cricket_game_content_app/application/results_state.dart';
import 'package:cricket_game_content_app/application/series_notifier.dart';
import 'package:cricket_game_content_app/application/series_state.dart';
import 'package:cricket_game_content_app/data/fixtures_remote_service.dart';
import 'package:cricket_game_content_app/data/fixtures_repository.dart';
import 'package:cricket_game_content_app/data/results_remote_service.dart';
import 'package:cricket_game_content_app/data/results_repository.dart';
import 'package:cricket_game_content_app/data/series_remote_service.dart';
import 'package:cricket_game_content_app/data/series_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ------------- providers for series page -------------
final seriesDataRemoteServiceProvider = Provider((ref) => SeriesRemoteService());

final seriesDataRepoProvider = Provider((ref) => SeriesRepository(ref.watch(seriesDataRemoteServiceProvider)));

final seriesDataNotifierProvider = StateNotifierProvider<SeriesNotifier, SeriesState>(
    (ref) => SeriesNotifier(ref.watch(seriesDataRepoProvider)));

final seriesWidgetIndex = StateNotifierProvider<IntegerProvider, int>(
    (ref) => IntegerProvider(0));

final selectedSeriesDetailProvider = StateNotifierProvider<SeriesDetailProvider, SeriesClass?>(
    (ref) => SeriesDetailProvider());

final fixtureDetailSelectionOverlayProvider = StateNotifierProvider<FixtureDetailProvider, FixtureClass?>(
    (ref) => FixtureDetailProvider());

// ------------- end providers for series page -------------

// ------------- providers for fixtures page -------------
final fixturesDataRemoteServiceProvider = Provider((ref) => FixturesRemoteService());

final fixturesDataRepoProvider = Provider((ref) => FixturesRepository(ref.watch(fixturesDataRemoteServiceProvider)));

final fixturesDataNotifierProvider = StateNotifierProvider<FixturesNotifier, FixturesState>(
    (ref) => FixturesNotifier(ref.watch(fixturesDataRepoProvider)));

final selectedFixturesDetailProvider = StateNotifierProvider<FixtureDetailProvider, FixtureClass?>(
    (ref) => FixtureDetailProvider());

final fixtureDateFilterOverlayIsOpen = StateNotifierProvider<BoolProvider, bool>((ref) => BoolProvider());

final fixturesWidgetIndex = StateNotifierProvider<IntegerProvider, int>(
    (ref) => IntegerProvider(0));
// ------------- end providers for fixtures page -------------

// ------------- providers for results page -------------
final resultsDataRemoteServiceProvider = Provider((ref) => ResultsRemoteService());

final resultsDataRepoProvider = Provider((ref) => ResultsRepository(ref.watch(resultsDataRemoteServiceProvider)));

final resultsDataNotifierProvider = StateNotifierProvider<ResultsNotifier, ResultsState>(
    (ref) => ResultsNotifier(ref.watch(resultsDataRepoProvider)));

final selectedResultsDetailProvider = StateNotifierProvider<FixtureDetailProvider, FixtureClass?>(
    (ref) => FixtureDetailProvider());

final resultDateFilterOverlayIsOpen = StateNotifierProvider<BoolProvider, bool>((ref) => BoolProvider());

final resultsWidgetIndex = StateNotifierProvider<IntegerProvider, int>(
    (ref) => IntegerProvider(0));
// ------------- end providers for results page -------------

// ------------- others -------------
final pageListIndex = StateNotifierProvider<IntegerProvider, int>(
    (ref) => IntegerProvider(0));




// ------------- custom state notifiers -------------
class IntegerProvider extends StateNotifier<int> {
  IntegerProvider(int initial) : super(initial);
  void change(index) => state = index;
}

class BoolProvider extends StateNotifier<bool> {
  BoolProvider() : super(false);
  void change() => state = !state;
}

class SeriesDetailProvider extends StateNotifier<SeriesClass?> {
  SeriesDetailProvider() : super(null);
  void change(SeriesClass seriesDetail) => state = seriesDetail;
}

class FixtureDetailProvider extends StateNotifier<FixtureClass?> {
  FixtureDetailProvider() : super(null);
  void change(FixtureClass fixtureDetail) => state = fixtureDetail;
  void remove() => state = null;
}