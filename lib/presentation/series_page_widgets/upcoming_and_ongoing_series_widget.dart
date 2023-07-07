import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/widgets/back_button_widget.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UpcomingAndOngoingSeriesWidget extends ConsumerStatefulWidget {
  const UpcomingAndOngoingSeriesWidget({Key? key}) : super(key: key);

  @override
  UpcomingAndOngoingSeriesWidgetState createState() =>
      UpcomingAndOngoingSeriesWidgetState();
}

class UpcomingAndOngoingSeriesWidgetState
    extends ConsumerState<UpcomingAndOngoingSeriesWidget> {
  @override
  Widget build(BuildContext context) {
    String ongoingOrUpcoming =
        ref.watch(seriesWidgetIndex) == 2 ? "Upcoming" : "Current series";

    List<SeriesClass> seriesList = ref
        .read(seriesDataNotifierProvider)
        .dataList
        .where((series) => series.status == ongoingOrUpcoming)
        .toList();

    var state = ref.watch(seriesDataNotifierProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            color: AppStyles.containerMainAppColour,
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.mobileBorderPadding),
            alignment: Alignment.centerLeft,
            child: BackButtonWidget(
              onPressedFunction: () =>
                  ref.read(seriesWidgetIndex.notifier).change(0),
            ),
          ),
          Container(
            height: 25,
            width: 150,
            alignment: Alignment.center,
            child: Text("$ongoingOrUpcoming list"),
          ),
          state.errorStatus
              ? const SizedBox(
                  child: Text("An error occurred please try again"))
              : Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      constraints: AppStyles.appContainerConstraints,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: seriesList.length,
                        itemBuilder: (context, index) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(selectedSeriesDetailProvider.notifier)
                                  .change(seriesList[index]);
                              ref
                                  .read(seriesWidgetIndex.notifier)
                                  .change(1); // switch to series details page
                            },
                            child: RoundedContainerWidget(
                              height: 150,
                              margin: AppStyles.listItemVerticalSpacing,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          seriesList[index].seriesName,
                                        ),
                                        Text(
                                          seriesList[index].season,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal:
                                            AppStyles.mobileBorderPadding),
                                    alignment: Alignment.center,
                                    child: Text(
                                      seriesList[index].status,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
