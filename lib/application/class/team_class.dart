import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
// part 'team_class.freezed.dart';

// @freezed
// class Team with _$Team {
//   const factory Team({
//     required String code,
//     required String id,
//     required String name,
//   }) = _Team;

// }

class Team {
  String code;
  String id;
  String name;

  Team(this.code, this.id, this.name);

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Team &&
  //         runtimeType == other.runtimeType &&
  //         code == other.code &&
  //         id == other.id &&
  //         name == other.name;

  // @override
  // int get hashCode => Object.hash(code, id, name);
}
