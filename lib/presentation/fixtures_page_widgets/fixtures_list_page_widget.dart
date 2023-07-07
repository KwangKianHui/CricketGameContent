import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/date_filter_overlay_widget.dart';
import 'package:cricket_game_content_app/presentation/fixtures_page_widgets/fixtures_body_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixturesListPageWidget extends ConsumerStatefulWidget {
  const FixturesListPageWidget({Key? key}) : super(key: key);

  @override
  FixturesListPageWidgetState createState() => FixturesListPageWidgetState();
}

class FixturesListPageWidgetState
    extends ConsumerState<FixturesListPageWidget> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(fixturesDataNotifierProvider);
    bool overlayIsOpen = ref.watch(dateFilterOverlayIsOpen);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppStyles.buttonGradientColour,
          child: const Icon(Icons.date_range, color: Colors.white),
          onPressed: () => ref.read(dateFilterOverlayIsOpen.notifier).change()),
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
            state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : !state.errorStatus
                    ? const Center(child: FixturesBodyWidget())
                    : Center(
                        child: Text(state.errorMessage),
                      ),
            overlayIsOpen ? const DateFilterOverlayWidget() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
