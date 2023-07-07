import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateFilterOverlayWidget extends ConsumerStatefulWidget {
  const DateFilterOverlayWidget({Key? key}) : super(key: key);

  @override
  DateFilterOverlayWidgetState createState() =>
      DateFilterOverlayWidgetState();
}

class DateFilterOverlayWidgetState extends ConsumerState<DateFilterOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? AppStyles.mobileBorderPadding
            : AppStyles.webBorderPadding,
      ),
      color: AppStyles.containerMainAppColour,
      child: CalendarDatePicker(
        initialDate: DateTime(2020, 9, 22), 
        firstDate: DateTime(2020, 1, 1),
        lastDate: DateTime.now(),
        onDateChanged: (value) {
          // initiate api call to update list
          // leading zeroes required
          ref.read(fixturesDataNotifierProvider.notifier).getFixtureListByDate("${value.year}-${DateFormat("MM").format(value)}-${DateFormat("dd").format(value)}");
          // close overlay
          ref.read(dateFilterOverlayIsOpen.notifier).change();
        },
      ),
    );
  }
}
