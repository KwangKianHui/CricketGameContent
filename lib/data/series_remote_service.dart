import 'dart:convert';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/data/dto/series_dto.dart';
import 'package:cricket_game_content_app/shared/api_key.dart';
import 'package:http/http.dart' as http;

class SeriesRemoteService {
  SeriesRemoteService();

  /// Retrieve list of series data through cricket game API.
  /// Converts json to list of SeriesDTO and returns List<SeriesDTO>.
  Future<List<SeriesDTO>> getSeriesDataList() async {
    final response = await http.get(
        Uri.parse("https://cricket-live-data.p.rapidapi.com/series"),
        headers: {"X-RapidAPI-Key": API_TOKEN, 'X-RapidAPI-Host': API_HOST});

    if (response.statusCode != 200) {
      throw Exception("API error");
    }

    List<SeriesDTO> seriesDTOList = [];

    var data = await json.decode(response.body);
    data["results"].forEach((seriesListObj) {
      seriesListObj["series"].forEach((seriesObj) {
        seriesDTOList.add(
          SeriesDTO(
            seriesId: seriesObj["series_id"].toString(),
            season: seriesObj["season"],
            seriesName: seriesObj["series_name"],
            latestUpdateDate: seriesObj["updated_at"].toString(),
            status: seriesObj["status"],
            type: seriesListObj["type"],
          ),
        );
      });
    });

    return seriesDTOList;
  }

  /// Retrieve list of fixtures by series data through cricket game API.
  /// Converts json to list of FixtureDTO and returns List<FixtureDTO>.
  Future<List<FixtureDTO>> getFixtureBySeriesDataList(String seriesId) async {
    final response = await http.get(
        Uri.parse(
            "https://cricket-live-data.p.rapidapi.com/fixtures-by-series/$seriesId"),
        headers: {"X-RapidAPI-Key": "\${{ secrets.API_TOKEN }}", 'X-RapidAPI-Host': "\${{ secrets.API_HOST }}"});

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
}
