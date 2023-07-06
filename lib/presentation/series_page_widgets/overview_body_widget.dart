import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_game_content_app/application/class/series_class.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OverviewBodyWidget extends ConsumerStatefulWidget {
  const OverviewBodyWidget({Key? key}) : super(key: key);

  @override
  OverviewBodyWidgetState createState() => OverviewBodyWidgetState();
}

class OverviewBodyWidgetState extends ConsumerState<OverviewBodyWidget> {
  List<Widget> tenUpcomingSeriesWidgetList() {
    if (ref.read(seriesDataNotifierProvider).dataList.isEmpty) {
      return [];
    }
    List<SeriesClass> upcomingSeries = ref
        .read(seriesDataNotifierProvider)
        .dataList
        .where((element) => element.status == "Upcoming")
        .toList()
        .sublist(0, 10);

    return upcomingSeries
        .map(
          (series) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ref.read(selectedSeriesDetailProvider.notifier).change(series);
                ref
                    .read(seriesWidgetIndex.notifier)
                    .change(1); // switch to series details page
              },
              child: Container(
                height: 200,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.mobileBorderPadding),
                alignment: Alignment.center,
                child: Text(series.seriesName,
                    style: AppStyles.montserrat20, textAlign: TextAlign.center),
              ),
            ),
          ),
        )
        .toList();
  }

  List<Widget> tenOngoingSeriesWidgetList() {
    if (ref.read(seriesDataNotifierProvider).dataList.isEmpty) {
      return [];
    }
    List<SeriesClass> upcomingSeries = ref
        .read(seriesDataNotifierProvider)
        .dataList
        .where((element) => element.status == "Current series")
        .toList()
        .sublist(0, 10);

    return upcomingSeries
        .map(
          (series) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ref.read(selectedSeriesDetailProvider.notifier).change(series);
                ref
                    .read(seriesWidgetIndex.notifier)
                    .change(1); // switch to series details page
              },
              child: Container(
                height: 200,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.mobileBorderPadding),
                alignment: Alignment.center,
                child: Text(series.seriesName,
                    style: AppStyles.montserrat20, textAlign: TextAlign.center),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // view series
          const SizedBox(height: AppStyles.mobileBorderPadding),
          const Text("10 Upcoming Series:"),
          RoundedContainerWidget(
            height: 250,
            width: MediaQuery.of(context).size.width * 0.7,
            margin: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const EdgeInsets.symmetric(
                    horizontal: AppStyles.mobileBorderPadding)
                : const EdgeInsets.symmetric(
                    horizontal: AppStyles.webBorderPadding),
            child: CarouselSlider(
              items: tenUpcomingSeriesWidgetList(),
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ref.read(seriesWidgetIndex.notifier).change(2);
              },
              child: RoundedContainerWidget(
                height: 25,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("View more upcoming series"),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppStyles.mobileBorderPadding),
          const Text("10 Ongoing Series:"),
          RoundedContainerWidget(
            height: 250,
            width: MediaQuery.of(context).size.width * 0.7,
            margin: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const EdgeInsets.symmetric(
                    horizontal: AppStyles.mobileBorderPadding)
                : const EdgeInsets.symmetric(
                    horizontal: AppStyles.webBorderPadding),
            child: CarouselSlider(
              items: tenOngoingSeriesWidgetList(),
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ref.read(seriesWidgetIndex.notifier).change(3);
              },
              child: RoundedContainerWidget(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("View more ongoing series"),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppStyles.mobileBorderPadding),
        ],
      ),
    );
  }
}
