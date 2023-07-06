import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/operation_failure.dart';
import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:cricket_game_content_app/data/series_remote_service.dart';
import 'package:dartz/dartz.dart';
class SeriesRepository {
  final SeriesRemoteService _seriesRemoteService;

  SeriesRepository(this._seriesRemoteService);

  /// get List<[SeriesDTO]> from remote service
  /// 
  /// return a list of [SeriesClass] if successful
  /// 
  /// TODO: return [OperationFailure.cancelledOperation] if operation cancelled
  /// 
  /// TODO: return [OperationFailure.notFound] if database not found
  /// 
  /// return [OperationFailure.unexpected] if unexpected/unknown database exception thrown
  /// 
  Future<Either<OperationFailure, List<SeriesClass>>> getSeriesDataList() async {
    try {
      final seriesDTOList = await _seriesRemoteService.getSeriesDataList();
      return right(seriesDTOList
          .map((seriesDTO) => seriesDTO.fromDTO())
          .toList());
    } on Exception catch (e) {
      // handle other error types here
      return left(const OperationFailure.unexpected("Unexpected Error"));
    }
  }

  /// get List<[FixtureDTO]> from remote service
  /// 
  /// return a list of [FixtureClass] if successful
  /// 
  /// TODO: return [OperationFailure.cancelledOperation] if operation cancelled
  /// 
  /// TODO: return [OperationFailure.notFound] if database not found
  /// 
  /// return [OperationFailure.unexpected] if unexpected/unknown database exception thrown
  /// 
  Future<Either<OperationFailure, List<FixtureClass>>> getFixtureBySeriesDataList(String seriesId) async {
    try {
      final fixtureDTOList = await _seriesRemoteService.getFixtureBySeriesDataList(seriesId);
      return right(fixtureDTOList
          .map((fixtureDTO) => fixtureDTO.fromDTO())
          .toList());
    } on Exception catch (e) {
      // handle other error types here
      return left(const OperationFailure.unexpected("Unexpected Error"));
    }
  }
}