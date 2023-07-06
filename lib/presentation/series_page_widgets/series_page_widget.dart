import 'package:cricket_game_content_app/presentation/series_page_widgets/series_detail_widget.dart';
import 'package:cricket_game_content_app/presentation/series_page_widgets/series_overview_widget.dart';
import 'package:cricket_game_content_app/presentation/series_page_widgets/upcoming_and_ongoing_series_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesPageWidget extends ConsumerStatefulWidget {
  const SeriesPageWidget({Key? key}) : super(key: key);

  @override
  SeriesPageWidgetState createState() => SeriesPageWidgetState();
}

class SeriesPageWidgetState extends ConsumerState<SeriesPageWidget> {
  @override
  void initState() {
    if (ref.read(seriesDataNotifierProvider).dataList.isEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () async {
        await ref.read(seriesDataNotifierProvider.notifier).getSeriesList();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    ref.read(seriesDataNotifierProvider.notifier).dispose();
    super.dispose();
  }

  List<Widget> seriesWidgetList = [
    const SeriesOverviewWidget(),
    const SeriesDetailWidget(),
    const UpcomingAndOngoingSeriesWidget(),
    const UpcomingAndOngoingSeriesWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return seriesWidgetList[ref.watch(seriesWidgetIndex)];
  }
}
