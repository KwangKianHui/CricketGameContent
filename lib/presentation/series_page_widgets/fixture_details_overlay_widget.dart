import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/presentation/const/formats.dart';
import 'package:cricket_game_content_app/presentation/widgets/rounded_container_widget.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixtureDetailsOverlayWidget extends ConsumerWidget {
  const FixtureDetailsOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fixtureDetail = ref.read(fixtureDetailSelectionOverlayProvider)!;
    return GestureDetector(
      onTap: () =>
          ref.read(fixtureDetailSelectionOverlayProvider.notifier).remove(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppStyles.mainAppColour.withOpacity(0.7),
        alignment: Alignment.center,
        child: RoundedContainerWidget(
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.mobileBorderPadding,
            vertical: AppStyles.webBorderPadding,
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => ref
                    .read(fixtureDetailSelectionOverlayProvider.notifier)
                    .remove(),
                child: const Icon(Icons.close),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      fixtureDetail.home.name,
                    ),
                    Text(fixtureDetail.result == ""
                        ? "0 - 0"
                        : fixtureDetail.result),
                    Text(
                      fixtureDetail.away.name,
                    ),
                  ],
                ),
              ),
              Expanded(child: Text(fixtureDetail.matchTitle)),
              Expanded(child: Text(fixtureDetail.venue)),
              Expanded(child: Text(dateFormatter.format(fixtureDetail.fixtureDate))),
              Expanded(child: Text(fixtureDetail.status)),
            ],
          ),
        ),
      ),
    );
  }
}
