import 'package:cricket_game_content_app/presentation/bottom_navigation_bar_widget.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_page_widget.dart';
import 'package:cricket_game_content_app/presentation/results_page_widgets/results_page_widget.dart';
import 'package:cricket_game_content_app/presentation/series_page_widgets/series_page_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:cricket_game_content_app/presentation/const/app_styles.dart';

class MainAppWidget extends ConsumerStatefulWidget {
  const MainAppWidget({Key? key}) : super(key: key);

  @override
  MainAppWidgetState createState() => MainAppWidgetState();
}

class MainAppWidgetState extends ConsumerState<MainAppWidget> {
  List<Widget> pageList = const [
    SeriesPageWidget(),
    FixturesPageWidget(),
    ResultsPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cricket Game Content",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppStyles.mainAppColour,
        fontFamily: 'Montserrat',
      ),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 450,
        defaultScale: true,
        defaultName: "16-INCH",
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(900, name: "MINI-DESKTOP"),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.resize(1728, name: "16-INCH"),
          const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
      home: Scaffold(
        backgroundColor: AppStyles.mainAppColour,
        body: pageList[ref.watch(pageListIndex)],
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
