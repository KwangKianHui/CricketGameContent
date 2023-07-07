// ignore_for_file: invalid_use_of_protected_member
import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/operation_failure.dart';
import 'package:cricket_game_content_app/application/class/team_class.dart';
import 'package:cricket_game_content_app/application/results_notifier.dart';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/data/results_remote_service.dart';
import 'package:cricket_game_content_app/data/results_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockResultsRemoteService extends Mock implements ResultsRemoteService {}

class MockResultsRepository extends Mock implements ResultsRepository {}

void main() {
  late ResultsNotifier systemUnderTest1;
  late ResultsRepository systemUnderTest2;
  late MockResultsRepository mockResultsRepository;
  late MockResultsRemoteService mockResultsRemoteService;

  setUp(() {
    mockResultsRemoteService = MockResultsRemoteService();
    mockResultsRepository = MockResultsRepository();
    systemUnderTest1 = ResultsNotifier(mockResultsRepository);
    systemUnderTest2 = ResultsRepository(mockResultsRemoteService);
  });

  List<FixtureClass> mockFixturesClassList = [
    FixtureClass(
      fixtureId: "2432999",
      seriesId: "608",
      venue: "Dubai International Cricket Stadium (night)",
      matchTitle:
          "Delhi Capitals v Kings XI Punjab at Dubai International Cricket Stadium (night), T20.",
      matchSubTitle: "2nd Match",
      status: "Complete",
      result: "Match tied (Delhi Capitals won the one-over eliminator)",
      fixtureDate: DateTime.parse("2020-09-20T14:00:00+00:00"),
      home: Team("", "120252", "Delhi Capitals"),
      away: Team("KXI", "101748", "Kings XI Punjab"),
    ),
    FixtureClass(
      fixtureId: "2415585",
      seriesId: "606",
      venue: "County Ground, Chelmsford",
      matchTitle: "Essex v Sussex at County Ground, Chelmsford, T20.",
      matchSubTitle: "South Group",
      status: "Complete",
      result: "Sussex won by 4 wickets",
      fixtureDate: DateTime.parse("2020-09-20T12:00:00+00:00"),
      home: Team("", "120804", "Essex"),
      away: Team("", "120789", "Sussex"),
    )
  ];

  List<FixtureDTO> mockFixturesDTOList = const [
    FixtureDTO(
      fixtureId: "2432999",
      seriesId: "608",
      venue: "Dubai International Cricket Stadium (night)",
      matchTitle:
          "Delhi Capitals v Kings XI Punjab at Dubai International Cricket Stadium (night), T20.",
      matchSubTitle: "2nd Match",
      status: "Complete",
      result: "Match tied (Delhi Capitals won the one-over eliminator)",
      fixtureDate: "2020-09-20T14:00:00+00:00",
      home: "-120252-Delhi Capitals",
      away: "KXI-101748-Kings XI Punjab",
    ),
    FixtureDTO(
      fixtureId: "2415585",
      seriesId: "606",
      venue: "County Ground, Chelmsford",
      matchTitle: "Essex v Sussex at County Ground, Chelmsford, T20.",
      matchSubTitle: "South Group",
      status: "Complete",
      result: "Sussex won by 4 wickets",
      fixtureDate: "2020-09-20T12:00:00+00:00",
      home: "-120789-Sussex",
      away: "-120804-Essex",
    )
  ];

  group("Test Series Notifier - sut 1", () {
    void initialiseForSuccessfulTest() {
      when(() => mockResultsRepository.getLast50ResultsDataList())
          .thenAnswer((_) async => right(mockFixturesClassList));
      when(() => mockResultsRepository.getResultListByDate("2020-09-20"))
          .thenAnswer((_) async => right(mockFixturesClassList));
    }

    void initialiseForFailureTest() {
      when(() => mockResultsRepository.getLast50ResultsDataList()).thenAnswer(
          (_) async =>
              left(const OperationFailure.unexpected("Unexpected Error")));
      when(() => mockResultsRepository.getResultListByDate("2020-09-20"))
          .thenAnswer((_) async =>
              left(const OperationFailure.unexpected("Unexpected Error")));
    }

    test(
        "verify repository layer's.getLast50ResultsDataList function is called once",
        () async {
      initialiseForSuccessfulTest();
      await systemUnderTest1.getLast50ResultsDataList();
      verify(() => mockResultsRepository.getLast50ResultsDataList())
          .called(1);
    });

    test("getSeriesList with successful API call", () async {
      initialiseForSuccessfulTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getLast50ResultsDataList();
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.dataList, mockFixturesClassList);
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getSeriesList with failed API call", () async {
      initialiseForFailureTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getLast50ResultsDataList();
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.errorStatus, true);
      expect(systemUnderTest1.state.errorMessage, "Unknown error");
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getFixturesBySeries with successful API call", () async {
      initialiseForSuccessfulTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getResultListByDate("2020-09-20");
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.dataList, mockFixturesClassList);
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getFixturesBySeries with failed API call", () async {
      initialiseForFailureTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getResultListByDate("2020-09-20");
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.errorStatus, true);
      expect(systemUnderTest1.state.errorMessage, "Unknown error");
      expect(systemUnderTest1.state.isLoading, false);
    });
  });

  group("Test Series Repository - sut 2", () {
    void initialiseForSuccessfulTest() {
      when(() => mockResultsRemoteService.getLast50ResultsDataList())
          .thenAnswer((_) async => mockFixturesDTOList);
      when(() => mockResultsRemoteService.getResultListByDate("2020-09-20"))
          .thenAnswer((_) async => mockFixturesDTOList);
    }

    void initialiseForFailureTest() {
      when(() => mockResultsRemoteService.getLast50ResultsDataList())
          .thenAnswer((_) async => throw Exception("API Error"));
      when(() => mockResultsRemoteService.getResultListByDate("2020-09-20"))
          .thenAnswer((_) async => throw Exception("API Error"));
    }

    test(
        "verify remote service layer's.getLast50ResultsDataList function is called once",
        () async {
      initialiseForSuccessfulTest();
      await systemUnderTest2.getLast50ResultsDataList();
      verify(() => mockResultsRemoteService.getLast50ResultsDataList())
          .called(1);
    });

    // test("test SeriesDTO.fromDTO() function", () async {
    //   expect(mockFixturesClassList,
    //       mockFixturesDTOList.map((e) => e.fromDTO()).toList());
    // });

    test("getLast50ResultsDataList with failed API call", () async {
      initialiseForFailureTest();
      final future = systemUnderTest2.getLast50ResultsDataList();
      expect(await future,
          left(const OperationFailure.unexpected("Unexpected Error")));
    });

    test("getFixturesBySeries with failed API call", () async {
      initialiseForFailureTest();
      final future = systemUnderTest2.getResultListByDate("2020-09-20");
      expect(await future,
          left(const OperationFailure.unexpected("Unexpected Error")));
    });
  });
}
