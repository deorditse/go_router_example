export 'src_screens_nav/library_screen/library_screen.dart';
export 'src_screens_nav/library_screen/pages/album_screen/album_screen.dart';
export 'src_screens_nav/library_screen/pages/song_screen/song_screen.dart';
export 'src_screens_nav/recently_screen/recently_screen.dart';
export 'src_screens_nav/search_screen/search_screen.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:english_words/english_words.dart';
import 'package:golden_plan/ui_layout/pages/src/bottom_navigation_screens/src_screens_nav.dart';

class BottomNavigationScreens extends StatelessWidget {
  final Widget child;

  const BottomNavigationScreens({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_music_rounded),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Recently Played',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith(RecentlyPlayedScreen.path)) {
      return 1;
    } else if (location.startsWith(SearchScreen.path)) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 1:
        GoRouter.of(context).go(RecentlyPlayedScreen.path);
        break;
      case 2:
        GoRouter.of(context).go(SearchScreen.path);
        break;
      case 0:
      default:
        GoRouter.of(context).go(LibraryScreen.path);
        break;
    }
  }
}
