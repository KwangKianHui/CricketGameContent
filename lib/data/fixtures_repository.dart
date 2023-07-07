import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/operation_failure.dart';
import 'package:cricket_game_content_app/data/dto/fixture_dto.dart';
import 'package:cricket_game_content_app/data/fixtures_remote_service.dart';
import 'package:dartz/dartz.dart';

class FixturesRepository {
  final FixturesRemoteService _fixturesRemoteService;

  FixturesRepository(this._fixturesRemoteService);

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
  Future<Either<OperationFailure, List<FixtureClass>>> getNext50FixturesDataList() async {
    try {
      final fixturesDTOList = await _fixturesRemoteService.getNext50FixturesDataList();
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
  Future<Either<OperationFailure, List<FixtureClass>>> getFixtureListByDate(String date) async {
    try {
      final fixtureDTOList = await _fixturesRemoteService.getFixtureListByDate(date);
      return right(fixtureDTOList
          .map((fixtureDTO) => fixtureDTO.fromDTO())
          .toList());
    } on Exception catch (e) {
      // handle other error types here
      return left(const OperationFailure.unexpected("Unexpected Error"));
    }
  }
}