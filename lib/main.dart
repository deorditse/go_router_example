import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:english_words/english_words.dart';
import 'package:golden_plan/ui_layout/pages/pages.dart';
import 'package:golden_plan/ui_layout/styles/styles.dart';
import 'ui_layout/router_config.dart';

void main() {
  runApp(MusicAppDemo());
}

class MusicAppDemo extends StatelessWidget {
  MusicAppDemo({Key? key}) : super(key: key);

  final MusicDatabase database = MusicDatabase.mock();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      routerConfig: routerConfig,
      builder: (context, child) {
        return MusicDatabaseScope(
          state: database,
          child: child!,
        );
      },
    );
  }
}
