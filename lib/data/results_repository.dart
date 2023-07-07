import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/operation_failure.dart';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/data/results_remote_service.dart';
import 'package:dartz/dartz.dart';

class ResultsRepository {
  final ResultsRemoteService _resultsRemoteService;

  ResultsRepository(this._resultsRemoteService);

  /// get List<[FixtureDTO]> from remote service
  /// 
  /// return a list of 50 upcoming [FixtureClass] if successful
  /// 
  /// TODO: return [OperationFailure.cancelledOperation] if operation cancelled
  /// 
  /// TODO: return [OperationFailure.notFound] if database not found
  /// 
  /// return [OperationFailure.unexpected] if unexpected/unknown database exception thrown
  /// 
  Future<Either<OperationFailure, List<FixtureClass>>> getLast50ResultsDataList() async {
    try {
      final fixturesDTOList = await _resultsRemoteService.getLast50ResultsDataList();
      return right(fixturesDTOList
          .map((fixturesDTO) => fixturesDTO.fromDTO())
          .toList());
    } on Exception catch (e) {
      // handle other error types here
      return left(const OperationFailure.unexpected("Unexpected Error"));
    }
  }

  /// get List<[FixtureDTO]> from remote service
  /// 
  /// return a list of [FixtureClass] on the specified date if successful
  /// 
  /// TODO: return [OperationFailure.cancelledOperation] if operation cancelled
  /// 
  /// TODO: return [OperationFailure.notFound] if database not found
  /// 
  /// return [OperationFailure.unexpected] if unexpected/unknown database exception thrown
  /// 
  Future<Either<OperationFailure, List<FixtureClass>>> getResultListByDate(String date) async {
    try {
      final fixtureDTOList = await _resultsRemoteService.getResultListByDate(date);
      return right(fixtureDTOList
          .map((fixtureDTO) => fixtureDTO.fromDTO())
          .toList());
    } on Exception catch (e) {
      // handle other error types here
      return left(const OperationFailure.unexpected("Unexpected Error"));
    }
  }
}