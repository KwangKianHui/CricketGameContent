import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cricket_game_content_app/presentation/main_app_widget.dart';

void main() {
  runApp(const ProviderScope(child: MainAppWidget()));
}