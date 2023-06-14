import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:golden_plan/ui_layout/pages/src/bottom_navigation_screens/widgets_for_all_bottom_nav_screens/widgets_for_all_bottom_nav_screens.dart';

class MusicDatabaseScope extends InheritedWidget {
  final MusicDatabase state;

  const MusicDatabaseScope({
    required this.state,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is MusicDatabaseScope && state != oldWidget.state;
  }
}

class MusicDatabase {
  final List<Album> albums;
  final List<Song> recentlyPlayed;
  final Map<String, Song> _allSongs = {};

  MusicDatabase(this.albums, this.recentlyPlayed) {
    _populateAllSongs();
  }

  factory MusicDatabase.mock() {
    final albums = _mockAlbums().toList();
    final recentlyPlayed = _mockRecentlyPlayed(albums).toList();
    return MusicDatabase(albums, recentlyPlayed);
  }

  Song getSongById(String songId) {
    if (_allSongs.containsKey(songId)) {
      return _allSongs[songId]!;
    }
    throw ('No song with ID $songId found.');
  }

  List<Song> search(String searchString) {
    final songs = <Song>[];
    for (var song in _allSongs.values) {
      final album = albums[int.tryParse(song.albumId)!];
      if (song.title.contains(searchString) ||
          album.title.contains(searchString)) {
        songs.add(song);
      }
    }
    return songs;
  }

  void _populateAllSongs() {
    for (var album in albums) {
      for (var song in album.songs) {
        _allSongs[song.fullId] = song;
      }
    }
  }

  static MusicDatabase of(BuildContext context) {
    final routeStateScope =
        context.dependOnInheritedWidgetOfExactType<MusicDatabaseScope>();
    if (routeStateScope == null) throw ('No RouteState in scope!');
    return routeStateScope.state;
  }

  static Iterable<Album> _mockAlbums() sync* {
    for (var i = 0; i < Colors.primaries.length; i++) {
      final color = Colors.primaries[i];
      final title = WordPair.random().toString();
      final artist = WordPair.random().toString();
      final songs = <Song>[];
      for (var j = 0; j < 12; j++) {
        final minutes = math.Random().nextInt(3) + 3;
        final seconds = math.Random().nextInt(60);
        final title = WordPair.random();
        final duration = Duration(minutes: minutes, seconds: seconds);
        final song = Song('$j', '$i', '$title', duration);

        songs.add(song);
      }
      yield Album('$i', title, artist, color, songs);
    }
  }

  static Iterable<Song> _mockRecentlyPlayed(List<Album> albums) sync* {
    for (var album in albums) {
      final songIndex = math.Random().nextInt(album.songs.length);
      yield album.songs[songIndex];
    }
  }
}
