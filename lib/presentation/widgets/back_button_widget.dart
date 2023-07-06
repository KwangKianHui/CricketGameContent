import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatefulWidget {
  const BackButtonWidget({Key? key, required this.onPressedFunction})
      : super(key: key);
  final void Function() onPressedFunction;

  @override
  State<BackButtonWidget> createState() => _BackButtonWidgetState();
}

class _BackButtonWidgetState extends State<BackButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressedFunction,
      icon: const Icon(Icons.arrow_back, color: AppStyles.appSubColour),
    );
  }
}
