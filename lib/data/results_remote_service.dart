import 'dart:convert';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/shared/api_key.dart';
import 'package:http/http.dart' as http;

class ResultsRemoteService {
  ResultsRemoteService();

  /// Retrieve list of series data through cricket game API.
  /// Converts json to list of SeriesDTO and returns List<SeriesDTO>.
  Future<List<FixtureDTO>> getLast50ResultsDataList() async {
    final response = await http.get(
        Uri.parse("https://cricket-live-data.p.rapidapi.com/results"),
        headers: {"X-RapidAPI-Key": API_TOKEN, 'X-RapidAPI-Host': API_HOST});

    if (response.statusCode != 200) {
      throw Exception("API error");
    }

    List<FixtureDTO> fixtureDTOList = [];

    var data = await json.decode(response.body);
    data["results"].forEach((fixtureObj) {
      fixtureDTOList.add(
        FixtureDTO(
          fixtureId: fixtureObj["id"].toString(),
          fixtureDate: fixtureObj["date"].toString(),
          matchTitle: fixtureObj["match_title"],
          matchSubTitle: fixtureObj["match_subtitle"],
          result: fixtureObj["result"],
          seriesId: fixtureObj["series_id"].toString(),
          status: fixtureObj["status"],
          venue: fixtureObj["venue"],
          home:
              "${fixtureObj["home"]["code"]}-${fixtureObj["home"]["id"]}-${fixtureObj["home"]["name"]}",
          away:
              "${fixtureObj["away"]["code"]}-${fixtureObj["away"]["id"]}-${fixtureObj["away"]["name"]}",
        ),
      );
    });

    return fixtureDTOList;
  }

  /// Retrieve list of fixtures by series data through cricket game API.
  /// Converts json to list of FixtureDTO and returns List<FixtureDTO>.
  /// date to be in yyyy-MM-dd format
  Future<List<FixtureDTO>> getResultListByDate(String date) async {
    final response = await http.get(
        Uri.parse(
            "https://cricket-live-data.p.rapidapi.com/results-by-date/$date"),
        headers: {"X-RapidAPI-Key": API_TOKEN, 'X-RapidAPI-Host': API_HOST});

    if (response.statusCode != 200) {
      throw Exception("API error");
    }

    List<FixtureDTO> fixtureDTOList = [];

    var data = await json.decode(response.body);

    // dynamic call of null
    if (data["results"] == null) {
      return [];
    }
    data["results"].forEach((fixtureObj) {
      fixtureDTOList.add(
        FixtureDTO(
          fixtureId: fixtureObj["id"].toString(),
          fixtureDate: fixtureObj["date"].toString(),
          matchTitle: fixtureObj["match_title"],
          matchSubTitle: fixtureObj["match_subtitle"],
          result: fixtureObj["result"],
          seriesId: fixtureObj["series_id"].toString(),
          status: fixtureObj["status"],
          venue: fixtureObj["venue"],
          home:
              "${fixtureObj["home"]["code"]}-${fixtureObj["home"]["id"]}-${fixtureObj["home"]["name"]}",
          away:
              "${fixtureObj["away"]["code"]}-${fixtureObj["away"]["id"]}-${fixtureObj["away"]["name"]}",
        ),
      );
    });

    return fixtureDTOList;
  }
}
