import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/const/formats.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixturesBodyWidget extends ConsumerStatefulWidget {
  const FixturesBodyWidget({Key? key}) : super(key: key);

  @override
  FixturesBodyWidgetState createState() => FixturesBodyWidgetState();
}

class FixturesBodyWidgetState extends ConsumerState<FixturesBodyWidget> {
  ScrollController listViewScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<FixtureClass> dataList =
        ref.watch(fixturesDataNotifierProvider).dataList;

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
            child: const Text("Upcoming Fixtures"),
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
                    ref
                        .read(selectedFixturesDetailProvider.notifier)
                        .change(dataList[index]);
                    ref
                        .read(fixturesWidgetIndex.notifier)
                        .change(1); // switch to fixtures details page
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
