import 'package:cricket_game_content_app/application/class/fixture_class.dart';
import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/series_page_widgets/fixture_details_overlay_widget.dart';
import 'package:cricket_game_content_app/presentation/widgets/back_button_widget.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SeriesDetailWidget extends ConsumerStatefulWidget {
  const SeriesDetailWidget({Key? key}) : super(key: key);

  @override
  SeriesDetailWidgetState createState() => SeriesDetailWidgetState();
}

class SeriesDetailWidgetState extends ConsumerState<SeriesDetailWidget> {
  @override
  void initState() {
    super.initState();

    if (ref.read(seriesDataNotifierProvider).fixtureListBySeries.isEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () async {
        // use of "!" as this page is only accessible after a series is selected and thus, ref.watch(selectedSeriesDetailProvider) will never be null
        await ref.read(seriesDataNotifierProvider.notifier).getFixturesBySeries(
            ref.watch(selectedSeriesDetailProvider)!.seriesId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SeriesClass selectedSeries = ref.watch(selectedSeriesDetailProvider)!;
    List<FixtureClass> fixtureList =
        ref.watch(seriesDataNotifierProvider).fixtureListBySeries;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Column(
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
              RoundedContainerWidget(
                margin: EdgeInsets.all(ResponsiveWrapper.of(context)
                        .isSmallerThan("BP-FOR-INIT-PAGE-TEXT")
                    ? AppStyles.mobileBorderPadding
                    : AppStyles.webBorderPadding),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(selectedSeries.seriesName),
                          Text(selectedSeries.season),
                          Text(selectedSeries.status),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppStyles.mobileBorderPadding),
                      alignment: Alignment.center,
                      child: Text(selectedSeries.type),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                width: 150,
                alignment: Alignment.center,
                child: const Text("Fixtures in this series"),
              ),
              ref.watch(seriesDataNotifierProvider).isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: fixtureList.length,
                            itemBuilder: (context, index) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(fixtureDetailSelectionOverlayProvider
                                          .notifier)
                                      .change(fixtureList[index]);
                                },
                                child: RoundedContainerWidget(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  margin: AppStyles.listItemVerticalSpacing,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                                fixtureList[index].matchSubTitle),
                                            Text(fixtureList[index].venue),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          DateFormat("dd MMMM yyyy hh:mm").format(
                                              fixtureList[index].fixtureDate),
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
          ref.watch(fixtureDetailSelectionOverlayProvider) == null
              ? const SizedBox()
              : const FixtureDetailsOverlayWidget(),
        ],
      ),
    );
  }
}
