import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_plan/ui_layout/pages/src/bottom_navigation_screens/widgets_for_all_bottom_nav_screens/widgets_for_all_bottom_nav_screens.dart';

class LibraryScreen extends StatelessWidget {
  static const String path = '/library';

  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: ListView.builder(
        itemBuilder: (context, albumId) {
          final album = database.albums[albumId];
          return AlbumTile(
            album: album,
            onTap: () {
              GoRouter.of(context).go('/library/album/$albumId');
            },
          );
        },
        itemCount: database.albums.length,
      ),
    );
  }
}
