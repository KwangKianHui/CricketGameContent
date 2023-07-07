import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/const/formats.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixturesOrResultsBodyWidget extends ConsumerStatefulWidget {
  const FixturesOrResultsBodyWidget({Key? key}) : super(key: key);

  @override
  FixturesOrResultsBodyWidgetState createState() =>
      FixturesOrResultsBodyWidgetState();
}

class FixturesOrResultsBodyWidgetState
    extends ConsumerState<FixturesOrResultsBodyWidget> {
  ScrollController listViewScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    bool isFixturePage = ref.watch(pageListIndex) == 1;
    List<FixtureClass> dataList = isFixturePage
        ? ref.watch(fixturesDataNotifierProvider).dataList
        : ref.watch(resultsDataNotifierProvider).dataList;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.7,
      constraints: AppStyles.appContainerConstraints,
      child: Column(
        children: [
          Container(
            height: 25,
            width: 150,
            alignment: Alignment.center,
            child: Text(isFixturePage ? "Upcoming Fixtures" : "Latest Results"),
          ),
          Expanded(
            child: ListView.builder(
              controller: listViewScrollController,
              shrinkWrap: true,
              itemCount: dataList.length,
              itemBuilder: (context, index) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (isFixturePage) {
                      ref
                          .read(selectedFixturesDetailProvider.notifier)
                          .change(dataList[index]);
                      ref
                          .read(fixturesWidgetIndex.notifier)
                          .change(1); // switch to fixtures details page
                    } else {
                      ref
                          .read(selectedResultsDetailProvider.notifier)
                          .change(dataList[index]);
                      ref
                          .read(resultsWidgetIndex.notifier)
                          .change(1); // switch to results details page
                    }
                  },
                  child: RoundedContainerWidget(
                    height: 150,
                    margin: AppStyles.listItemVerticalSpacing,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                dataList[index].matchSubTitle,
                              ),
                              Text(
                                dataList[index].venue,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: AppStyles.mobileBorderPadding),
                          alignment: Alignment.center,
                          child: Text(
                            dateFormatter.format(dataList[index].fixtureDate),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
