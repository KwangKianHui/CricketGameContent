// ignore_for_file: invalid_use_of_protected_member
import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/operation_failure.dart';
import 'package:cricket_game_content_app/application/class/team_class.dart';
import 'package:cricket_game_content_app/application/fixtures_notifier.dart';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/data/fixtures_remote_service.dart';
import 'package:cricket_game_content_app/data/fixtures_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFixturesRemoteService extends Mock implements FixturesRemoteService {}

class MockFixturesRepository extends Mock implements FixturesRepository {}

void main() {
  late FixturesNotifier systemUnderTest1;
  late FixturesRepository systemUnderTest2;
  late MockFixturesRepository mockFixturesRepository;
  late MockFixturesRemoteService mockFixturesRemoteService;

  setUp(() {
    mockFixturesRemoteService = MockFixturesRemoteService();
    mockFixturesRepository = MockFixturesRepository();
    systemUnderTest1 = FixturesNotifier(mockFixturesRepository);
    systemUnderTest2 = FixturesRepository(mockFixturesRemoteService);
  });

  List<FixtureClass> mockFixturesClassList = [
    FixtureClass(
      fixtureId: "2460507",
      seriesId: "600",
      venue: "Dubai International Cricket Stadium (night)",
      matchTitle:
          "Somerset v Essex at Lord's, London, First Class.",
      matchSubTitle: "Final",
      status: "Fixture",
      result: "",
      fixtureDate: DateTime.parse("2020-09-23T09:30:00+00:00"),
      home: Team("", "120762", "Somerset"),
      away: Team("", "120804", "Essex"),
    ),
    FixtureClass(
      fixtureId: "2433029",
      seriesId: "608",
      venue: "Zayed Cricket Stadium, Abu Dhabi (night)",
      matchTitle:
          "Kolkata Knight Riders v Mumbai Indians at Zayed Cricket Stadium, Abu Dhabi (night), T20.",
      matchSubTitle: "5th Match",
      status: "Fixture",
      result: "",
      fixtureDate: DateTime.parse("2020-09-23T14:00:00+00:00"),
      home: Team("KKR", "101751", "Kolkata Knight Riders"),
      away: Team("MIN", "101754", "Mumbai Indians"),
    )
  ];

  List<FixtureDTO> mockFixturesDTOList = const [
    FixtureDTO(
      fixtureId: "2460507",
      seriesId: "600",
      venue: "Dubai International Cricket Stadium (night)",
      matchTitle:
          "Somerset v Essex at Lord's, London, First Class.",
      matchSubTitle: "Final",
      status: "Fixture",
      result: "",
      fixtureDate: "2020-09-23T09:30:00+00:00",
      home: "-120762-Somerset",
      away: "-120804-Essex",
    ),
    FixtureDTO(
      fixtureId: "2433029",
      seriesId: "608",
      venue: "Zayed Cricket Stadium, Abu Dhabi (night)",
      matchTitle:
          "Kolkata Knight Riders v Mumbai Indians at Zayed Cricket Stadium, Abu Dhabi (night), T20.",
      matchSubTitle: "5th Match",
      status: "Fixture",
      result: "",
      fixtureDate: "2020-09-23T14:00:00+00:00",
      home: "KKR-101751-Kolkata Knight Riders",
      away: "MIN-101754-Mumbai Indians",
    )
  ];

  group("Test Series Notifier - sut 1", () {
    void initialiseForSuccessfulTest() {
      when(() => mockFixturesRepository.getNext50FixturesDataList())
          .thenAnswer((_) async => right(mockFixturesClassList));
      when(() => mockFixturesRepository.getFixtureListByDate("2020-09-23"))
          .thenAnswer((_) async => right(mockFixturesClassList));
    }

    void initialiseForFailureTest() {
      when(() => mockFixturesRepository.getNext50FixturesDataList()).thenAnswer(
          (_) async =>
              left(const OperationFailure.unexpected("Unexpected Error")));
      when(() => mockFixturesRepository.getFixtureListByDate("2020-09-23"))
          .thenAnswer((_) async =>
              left(const OperationFailure.unexpected("Unexpected Error")));
    }

    test("verify repository layer's getNext50FixturesDataList function is called once",
        () async {
      initialiseForSuccessfulTest();
      await systemUnderTest1.getNext50FixturesDataList();
      verify(() => mockFixturesRepository.getNext50FixturesDataList()).called(1);
    });

    test("getSeriesList with successful API call", () async {
      initialiseForSuccessfulTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getNext50FixturesDataList();
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.dataList, mockFixturesClassList);
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getSeriesList with failed API call", () async {
      initialiseForFailureTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getNext50FixturesDataList();
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.errorStatus, true);
      expect(systemUnderTest1.state.errorMessage, "Unknown error");
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getFixturesBySeries with successful API call", () async {
      initialiseForSuccessfulTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getFixtureListByDate("2020-09-23");
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.dataList, mockFixturesClassList);
      expect(systemUnderTest1.state.isLoading, false);
    });

    test("getFixturesBySeries with failed API call", () async {
      initialiseForFailureTest();

      expect(systemUnderTest1.state.isLoading, false);
      final future = systemUnderTest1.getFixtureListByDate("2020-09-23");
      expect(systemUnderTest1.state.isLoading, true);
      await future;
      expect(systemUnderTest1.state.errorStatus, true);
      expect(systemUnderTest1.state.errorMessage, "Unknown error");
      expect(systemUnderTest1.state.isLoading, false);
    });
  });

  group("Test Series Repository - sut 2", () {
    void initialiseForSuccessfulTest() {
      when(() => mockFixturesRemoteService.getNext50FixturesDataList())
          .thenAnswer((_) async => mockFixturesDTOList);
      when(() => mockFixturesRemoteService.getFixtureListByDate("2020-09-23"))
          .thenAnswer((_) async => mockFixturesDTOList);
    }

    void initialiseForFailureTest() {
      when(() => mockFixturesRemoteService.getNext50FixturesDataList())
          .thenAnswer((_) async => throw Exception("API Error"));
      when(() => mockFixturesRemoteService.getFixtureListByDate("2020-09-23"))
          .thenAnswer((_) async => throw Exception("API Error"));
    }

    test(
        "verify remote service layer's getNext50FixturesDataList function is called once",
        () async {
      initialiseForSuccessfulTest();
      await systemUnderTest2.getNext50FixturesDataList();
      verify(() => mockFixturesRemoteService.getNext50FixturesDataList()).called(1);
    });

    // test("test SeriesDTO.fromDTO() function", () async {
    //   expect(mockFixturesClassList,
    //       mockFixturesDTOList.map((e) => e.fromDTO()).toList());
    // });

    test("getNext50FixturesDataList with failed API call", () async {
      initialiseForFailureTest();
      final future = systemUnderTest2.getNext50FixturesDataList();
      expect(await future,
          left(const OperationFailure.unexpected("Unexpected Error")));
    });

    test("getFixturesBySeries with failed API call", () async {
      initialiseForFailureTest();
      final future = systemUnderTest2.getFixtureListByDate("2020-09-23");
      expect(await future,
          left(const OperationFailure.unexpected("Unexpected Error")));
    });
  });
}
