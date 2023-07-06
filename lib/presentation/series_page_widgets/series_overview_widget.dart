import 'package:cricket_game_content_app/presentation/series_page_widgets/overview_body_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesOverviewWidget extends ConsumerStatefulWidget {
  const SeriesOverviewWidget({Key? key}) : super(key: key);

  @override
  SeriesOverviewWidgetState createState() => SeriesOverviewWidgetState();
}

class SeriesOverviewWidgetState extends ConsumerState<SeriesOverviewWidget> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(seriesDataNotifierProvider);

    return Container(
      constraints: const BoxConstraints(
        minWidth: 480,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : !state.errorStatus
              ? const OverviewBodyWidget()
              : Center(
                  child: Text(state.errorMessage),
                ),
    );
  }
}
