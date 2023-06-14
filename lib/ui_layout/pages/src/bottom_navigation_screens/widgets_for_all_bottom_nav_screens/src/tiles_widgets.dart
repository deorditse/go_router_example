import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:english_words/english_words.dart';

class Album {
  final String id;
  final String title;
  final String artist;
  final Color color;
  final List<Song> songs;

  Album(this.id, this.title, this.artist, this.color, this.songs);
}

class Song {
  final String id;
  final String albumId;
  final String title;
  final Duration duration;

  Song(this.id, this.albumId, this.title, this.duration);

  String get fullId => '$albumId-$id';
}

class SongTile extends StatelessWidget {
  final Album album;
  final Song song;
  final VoidCallback? onTap;

  const SongTile(
      {Key? key, required this.album, required this.song, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          color: album.color,
          margin: const EdgeInsets.all(8),
        ),
      ),
      title: Text(song.title),
      trailing: SongDuration(
        duration: song.duration,
      ),
      onTap: onTap,
    );
  }
}

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback? onTap;

  const AlbumTile({Key? key, required this.album, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          color: album.color,
        ),
      ),
      title: Text(album.title),
      subtitle: Text(album.artist),
      onTap: onTap,
    );
  }
}

class SongDuration extends StatelessWidget {
  final Duration duration;

  const SongDuration({
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}');
  }
}
