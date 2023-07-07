import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/const/formats.dart';
import 'package:cricket_game_content_app/presentation/widgets/back_button_widget.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FixturesOrResultsDetailPageWidget extends ConsumerStatefulWidget {
  const FixturesOrResultsDetailPageWidget({Key? key}) : super(key: key);

  @override
  FixturesOrResultsDetailPageWidgetState createState() =>
      FixturesOrResultsDetailPageWidgetState();
}

class FixturesOrResultsDetailPageWidgetState
    extends ConsumerState<FixturesOrResultsDetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    var isFixturePage = ref.watch(pageListIndex) == 1;
    FixtureClass fixtureDetail = isFixturePage
        ? ref.watch(selectedFixturesDetailProvider)!
        : ref.watch(selectedResultsDetailProvider)!;

    return Scaffold(
      backgroundColor: AppStyles.mainAppColour,
      appBar: AppBar(
        leading: BackButtonWidget(
          onPressedFunction: () {
            if (isFixturePage) {
              ref.read(fixturesWidgetIndex.notifier).change(0);
              ref.read(selectedFixturesDetailProvider.notifier).remove();
            } else {
              ref.read(resultsWidgetIndex.notifier).change(0);
              ref.read(selectedResultsDetailProvider.notifier).remove();
            }
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: RoundedContainerWidget(
          margin: EdgeInsets.all(
              ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? AppStyles.mobileBorderPadding
                  : AppStyles.webBorderPadding),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      fixtureDetail.home.name,
                      softWrap: true,
                    ),
                    Text(fixtureDetail.result == ""
                        ? "0 - 0"
                        : fixtureDetail.result),
                    Text(
                      fixtureDetail.away.name,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              Expanded(child: Text(fixtureDetail.matchTitle)),
              Expanded(child: Text(fixtureDetail.venue)),
              Expanded(
                  child: Text(dateFormatter.format(fixtureDetail.fixtureDate))),
              Expanded(child: Text(fixtureDetail.status)),
            ],
          ),
        ),
      ),
    );
  }
}
