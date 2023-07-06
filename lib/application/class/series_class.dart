import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'series_class.freezed.dart';

@freezed
class SeriesClass with _$SeriesClass {
  const factory SeriesClass({
    required String seriesId,
    required String season, 
    required String seriesName, 
    required DateTime latestUpdateDate,
    required String status,
    required String type,
  }) = _SeriesClass;
}