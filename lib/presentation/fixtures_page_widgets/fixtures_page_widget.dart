import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_or_results_detail_page_widget.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_or_results_list_page_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixturesPageWidget extends ConsumerStatefulWidget {
  const FixturesPageWidget({Key? key}) : super(key: key);

  @override
  FixturesPageWidgetState createState() =>
      FixturesPageWidgetState();
}

class FixturesPageWidgetState
    extends ConsumerState<FixturesPageWidget> {
  @override
  void initState() {
    if (ref.read(fixturesDataNotifierProvider).dataList.isEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () async {
        await ref
            .read(fixturesDataNotifierProvider.notifier)
            .getNext50FixturesDataList();
      });
    }
    super.initState();
  }

  List<Widget> fixturesWidgetList = [
    const FixturesOrResultsListPageWidget(),
    const FixturesOrResultsDetailPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return fixturesWidgetList[ref.watch(fixturesWidgetIndex)];
  }
}
