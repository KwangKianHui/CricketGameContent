import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:cricket_game_content_app/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationBarWidget extends ConsumerStatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  BottomNavigationBarWidgetState createState() =>
      BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState
    extends ConsumerState<BottomNavigationBarWidget> {
  List<BottomNavigationBarItem> navBarItems() {
    return const [
      BottomNavigationBarItem(
        label: "Series",
        icon: Icon(Icons.tour),
        backgroundColor: AppStyles.mainAppColour,
      ),
      BottomNavigationBarItem(
        label: "Fixtures",
        icon: Icon(Icons.sports_cricket),
        backgroundColor: AppStyles.mainAppColour,
      ),
      BottomNavigationBarItem(
        label: "Results",
        icon: Icon(Icons.scoreboard),
        backgroundColor: AppStyles.mainAppColour,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: navBarItems(),
      selectedItemColor: Colors.white,
      unselectedItemColor: AppStyles.appSubColour,
      currentIndex: ref.watch(pageListIndex),
      onTap: (index) {
        ref.read(pageListIndex.notifier).change(index);
      },
    );
  }
}
