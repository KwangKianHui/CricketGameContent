import 'package:cricket_game_content_app/presentation/const/app_styles.dart';
import 'package:flutter/material.dart';

class RoundedContainerWidget extends StatelessWidget {
  const RoundedContainerWidget(
      {Key? key,
      this.height,
      this.width,
      this.padding,
      this.margin,
      required this.child})
      : super(key: key);
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      constraints: AppStyles.appContainerConstraints,
      decoration: BoxDecoration(
        color: AppStyles.containerMainAppColour,
        borderRadius: BorderRadius.circular(AppStyles.containerBorderRadius),
      ),
      child: child,
    );
  }
}
