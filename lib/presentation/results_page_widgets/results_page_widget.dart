import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_or_results_detail_page_widget.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_or_results_list_page_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultsPageWidget extends ConsumerStatefulWidget {
  const ResultsPageWidget({Key? key}) : super(key: key);

  @override
  ResultsPageWidgetState createState() => ResultsPageWidgetState();
}

class ResultsPageWidgetState extends ConsumerState<ResultsPageWidget> {
  @override
  void initState() {
    if (ref.read(resultsDataNotifierProvider).dataList.isEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () async {
        await ref
            .read(resultsDataNotifierProvider.notifier)
            .getLast50ResultsDataList();
      });
    }
    super.initState();
  }

  List<Widget> resultsWidgetList = [
    const FixturesOrResultsListPageWidget(),
    const FixturesOrResultsDetailPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return resultsWidgetList[ref.watch(resultsWidgetIndex)];
  }
}
