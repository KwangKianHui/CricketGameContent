// ignore_for_file: invalid_use_of_protected_member
import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/operation_failure.dart';
import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:cricket_game_content_app/application/class/team_class.dart';
import 'package:cricket_game_content_app/application/series_notifier.dart';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/data/dto/series_dto.dart';
import 'package:cricket_game_content_app/data/series_remote_service.dart';
import 'package:cricket_game_content_app/data/series_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSeriesRemoteService extends Mock implements SeriesRemoteService {}

class MockSeriesRepository extends Mock implements SeriesRepository {}

void main() {
  late SeriesNotifier systemUnderTest1;
  late SeriesRepository systemUnderTest2;
  late MockSeriesRepository mockSeriesRepository;
  late MockSeriesRemoteService mockSeriesRemoteService;

  setUp(() {
    mockSeriesRemoteService = MockSeriesRemoteService();
    mockSeriesRepository = MockSeriesRepository();
    systemUnderTest1 = SeriesNotifier(mockSeriesRepository);
    systemUnderTest2 = SeriesRepository(mockSeriesRemoteService);
  });

  List<SeriesClass> mockSeriesClassList = [
    SeriesClass(
      seriesId: "609",
      seriesName: "Afghanistan in Australia Test Match",
      season: "2020/21",
      status: "Upcoming",
      type: "Test",
      latestUpdateDate: DateTime.parse("2020-09-20T23:00:02.000000Z"),
    ),
    SeriesClass(
      seriesId: "610",
      seriesName: "Border-Gavaskar Trophy",
      season: "2020/21",
      status: "Upcoming",
      type: "Test",
      latestUpdateDate: DateTime.parse("2020-09-20T23:00:02.000000Z"),
    ),
  ];

  List<FixtureClass> mockFixturesClassList = [
    FixtureClass(
      fixtureId: "2433081",
      seriesId: "608",
      venue: "Dubai International Cricket Stadium (night)",
      matchTitle:
          "Sunrisers Hyderabad v Royal Challengers Bangalore at Dubai International Cricket Stadium (night), T20.",
      matchSubTitle: "3rd Match",
      status: "Fixture",
      result: "",
      fixtureDate: DateTime.parse("2020-09-21T14:00:00+00:00"),
      home: Team("SUH", "101763", "Sunrisers Hyderabad"),
      away: Team("RCB", "101760", "Royal Challengers Bangalore"),
    ),
    FixtureClass(
      fixtureId: "2433005",
      seriesId: "608",
      venue: "Sharjah Cricket Stadium (night)",
      matchTitle:
          "Rajasthan Royals v Chennai Super Kings at Sharjah Cricket Stadium (night), T20.",
      matchSubTitle: "4th Match",
      status: "Fixture",
      result: "",
      fixtureDate: DateTime.parse("2020-09-22T14:00:00+00:00"),
      home: Team("RAR", "101757", "Rajasthan Royals"),
      away: Team("CSK", "101742", "Chennai Super Kings"),
    )
  ];

  List<SeriesDTO> mockSeriesDTOList = const [
    SeriesDTO(
      seriesId: "609",
      seriesName: "Afghanistan in Australia Test Match",
      season: "2020/21",
      status: "Upcoming",
      type: "Test",
      latestUpdateDate: "2020-09-20T23:00:02.000000Z",
    ),
    SeriesDTO(
      seriesId: "610",
      seriesName: "Border-Gavaskar Trophy",
      season: "2020/21",
      status: "Upcoming",
      type: "Test",
      latestUpdateDate: "2020-09-20T23:00:02.000000Z",
    ),
  ];

  List<FixtureDTO> mockFixturesDTOList = const [
    FixtureDTO(
      fixtureId: "2433081",
      seriesId: "608",
      venue: "Dubai International Cricket Stadium (night)",
      matchTitle:
          "Sunrisers Hyderabad v Royal Challengers Bangalore at Dubai International Cricket Stadium (night), T20.",
      matchSubTitle: "3rd Match",
      status: "Fixture",
      result: "",
      fixtureDate: "2020-09-21T14:00:00+00:00",
      home: "SUH-101763-Sunrisers Hyderabad",
      away: "RCB-101760-Royal Challengers Bangalore",
    ),
    FixtureDTO(
      fixtureId: "2433005",
      seriesId: "608",
      venue: "Sharjah Cricket Stadium (night)",
      matchTitle:
          "Rajasthan Royals v Chennai Super Kings at Sharjah Cricket Stadium (night), T20.",
      matchSubTitle: "4th Match",
      status: "Fixture",
      result: "",
      fixtureDate: "2020-09-22T14:00:00+00:00",
      home: "RAR-101757-Rajasthan Royals",
      away: "CSK-101742-Chennai Super Kings",
    )
  ];

  group("Test Series Notifier - sut 1", () {
    void initialiseForSuccessfulTest() {
      when(() => mockSeriesRepository.getSeriesDataList())
          .thenAnswer((_) async => right(mockSeriesClassList));
      when(() => mockSeriesRepository.getFixtureBySeriesDataList("608"))
          .thenAnswer((_) async => right(mockFixturesClassList));
    }

    void initialiseForFailureTest() {
      when(() => mockSeriesRepository.getSeriesDataList()).thenAnswer(
          (_) async =>
              left(const OperationFailure.unexpected("Unexpected Error")));
      when(() => mockSeriesRepository.getFixtureBySeriesDataList("608"))
          .thenAnswer((_) async =>
              left(const OperationFailure.unexpected("Unexpected Error")));
    }

    test("verify repository layer's getSeriesDataList function is called once",
        () async {
      initialiseForSuccessfulTest();
      await systemUnderTest1.getSeriesList();
      verify(() => mockSeriesRepository.getSeriesDataList()).called(1);
    });

    test("getSeriesList with successful API call", () async {
      initialiseForSuccessfulTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getSeriesList();
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.dataList, mockSeriesClassList);
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getSeriesList with failed API call", () async {
      initialiseForFailureTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getSeriesList();
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.errorStatus, true);
      expect(systemUnderTest1.state.errorMessage, "Unknown error");
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getFixturesBySeries with successful API call", () async {
      initialiseForSuccessfulTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getFixturesBySeries("608");
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.fixtureListBySeries, mockFixturesClassList);
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getFixturesBySeries with failed API call", () async {
      initialiseForFailureTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getFixturesBySeries("608");
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.errorStatus, true);
      expect(systemUnderTest1.state.errorMessage, "Unknown error");
      expect(systemUnderTest1.state.isLoading, false);
    });
  });

  group("Test Series Repository - sut 2", () {
    void initialiseForSuccessfulTest() {
      when(() => mockSeriesRemoteService.getSeriesDataList())
          .thenAnswer((_) async => mockSeriesDTOList);
      when(() => mockSeriesRemoteService.getFixtureBySeriesDataList("608"))
          .thenAnswer((_) async => mockFixturesDTOList);
    }

    void initialiseForFailureTest() {
      when(() => mockSeriesRemoteService.getSeriesDataList())
          .thenAnswer((_) async => throw Exception("API Error"));
      when(() => mockSeriesRemoteService.getFixtureBySeriesDataList("608"))
          .thenAnswer((_) async => throw Exception("API Error"));
    }

    test(
        "verify remote service layer's getSeriesDataList function is called once",
        () async {
      initialiseForSuccessfulTest();
      await systemUnderTest2.getSeriesDataList();
      verify(() => mockSeriesRemoteService.getSeriesDataList()).called(1);
    });

    test("test SeriesDTO.fromDTO() function", () async {
      expect(mockSeriesClassList,
          mockSeriesDTOList.map((e) => e.fromDTO()).toList());
    });

    test("getSeriesDataList with failed API call", () async {
      initialiseForFailureTest();
      final future = systemUnderTest2.getSeriesDataList();
      expect(await future,
          left(const OperationFailure.unexpected("Unexpected Error")));
    });

    // test("test FixtureDTO.fromDTO() function", () async {
    //   final bool equal = const DeepCollectionEquality().equals(
    //       mockFixturesClassList,
    //       mockFixturesDTOList.map((e) => e.fromDTO()).toList());
    //   expect(equal, true);
    // });

    test("getFixturesBySeries with failed API call", () async {
      initialiseForFailureTest();
      final future = systemUnderTest2.getFixtureBySeriesDataList("608");
      expect(await future,
          left(const OperationFailure.unexpected("Unexpected Error")));
    });
  });
}
