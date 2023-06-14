import 'package:flutter/material.dart';
import 'package:golden_plan/ui_layout/pages/src/bottom_navigation_screens/widgets_for_all_bottom_nav_screens/widgets_for_all_bottom_nav_screens.dart';



class SongScreen extends StatelessWidget {
  static const String path = 'song/:songId';

  final String songId;

  const SongScreen({
    Key? key,
    required this.songId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final song = database.getSongById(songId);
    final albumIdInt = int.tryParse(song.albumId);
    final album = database.albums[albumIdInt!];

    return Scaffold(
      appBar: AppBar(
        title: Text('Song - ${song.title}'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Container(
                  color: album.color,
                  margin: const EdgeInsets.all(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      album.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
