import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_plan/ui_layout/pages/pages.dart';

/// The route configuration.
final GoRouter routerConfig = GoRouter(
  initialLocation: LibraryScreen.path,
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BottomNavigationScreens(
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: LibraryScreen.path,
          pageBuilder: (context, state) {
            return FadeTransitionPage(
              child: const LibraryScreen(),
              key: state.pageKey,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AlbumScreen.path,
              builder: (BuildContext context, GoRouterState state) {
                return AlbumScreen(
                  albumId: state.pathParameters['albumId'],
                );
              },
              routes: [
                GoRoute(
                  path: SongScreen.path,
                  // Display on the root Navigator
                  builder: (BuildContext context, GoRouterState state) {
                    return SongScreen(
                      songId: state.pathParameters['songId']!,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: RecentlyPlayedScreen.path,
          pageBuilder: (context, state) {
            return FadeTransitionPage(
              child: const RecentlyPlayedScreen(),
              key: state.pageKey,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: SongScreen.path,
              // Display on the root Navigator
              builder: (BuildContext context, GoRouterState state) {
                return SongScreen(
                  songId: state.pathParameters['songId']!,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: SearchScreen.path,
          pageBuilder: (context, state) {
            final query = state.queryParameters['q'] ?? '';
            return FadeTransitionPage(
              child: SearchScreen(
                query: query,
              ),
              key: state.pageKey,
            );
          },
        ),
      ],
    ),
  ],
);

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
