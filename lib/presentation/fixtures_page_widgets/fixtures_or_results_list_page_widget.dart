import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/date_filter_overlay_widget.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_or_results_body_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixturesOrResultsListPageWidget extends ConsumerStatefulWidget {
  const FixturesOrResultsListPageWidget({Key? key}) : super(key: key);

  @override
  FixturesOrResultsListPageWidgetState createState() =>
      FixturesOrResultsListPageWidgetState();
}

class FixturesOrResultsListPageWidgetState
    extends ConsumerState<FixturesOrResultsListPageWidget> {
  @override
  Widget build(BuildContext context) {
    var isFixturePage = ref.watch(pageListIndex) == 1;
    var fixtureState = ref.watch(fixturesDataNotifierProvider);
    var resultsState = ref.watch(resultsDataNotifierProvider);
    bool overlayIsOpen = isFixturePage
        ? ref.watch(fixtureDateFilterOverlayIsOpen)
        : ref.watch(resultDateFilterOverlayIsOpen);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppStyles.buttonGradientColour,
          child: const Icon(Icons.date_range, color: Colors.white),
          onPressed: () => isFixturePage
              ? ref.read(fixtureDateFilterOverlayIsOpen.notifier).change()
              : ref.read(resultDateFilterOverlayIsOpen.notifier).change()),
      body: Container(
        constraints: const BoxConstraints(
          minWidth: 480,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: overlayIsOpen
            ? AppStyles.mainAppColour.withOpacity(0.7)
            : AppStyles.mainAppColour,
        child: Stack(
          children: [
            (isFixturePage ? fixtureState.isLoading : resultsState.isLoading)
                ? const Center(child: CircularProgressIndicator())
                : (isFixturePage
                        ? !fixtureState.errorStatus
                        : !resultsState.errorStatus)
                    ? const Center(child: FixturesOrResultsBodyWidget())
                    : Center(
                        child: Text(isFixturePage
                            ? fixtureState.errorMessage
                            : resultsState.errorMessage),
                      ),
            overlayIsOpen ? const DateFilterOverlayWidget() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
