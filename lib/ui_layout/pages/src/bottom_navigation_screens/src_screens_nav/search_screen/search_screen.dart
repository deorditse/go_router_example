import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_plan/ui_layout/pages/src/bottom_navigation_screens/widgets_for_all_bottom_nav_screens/widgets_for_all_bottom_nav_screens.dart';

class SearchScreen extends StatefulWidget {
  static const String path = '/search';

  final String query;

  const SearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _currentQuery;

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final songs = database.search(widget.query);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newSearch) {
                _currentQuery = newSearch;
              },
              onEditingComplete: () {
                GoRouter.of(context).go(
                  '/search?q=$_currentQuery',
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final song = songs[index];
                return SongTile(
                  album: database.albums[int.tryParse(song.albumId)!],
                  song: song,
                  onTap: () {
                    GoRouter.of(context).go(
                        '/library/album/${song.albumId}/song/${song.fullId}');
                  },
                );
              },
              itemCount: songs.length,
            ),
          ),
        ],
      ),
    );
  }
}
