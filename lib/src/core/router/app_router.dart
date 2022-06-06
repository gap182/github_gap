import 'package:github_gap/src/features/commits/presentation/pages/commits_page.dart';
import 'package:github_gap/src/features/home/presentation/pages/home_page.dart';
import 'package:github_gap/src/features/repos/presentation/pages/profile_webpage.dart';
import 'package:github_gap/src/features/repos/presentation/pages/repos_page.dart';
import 'package:github_gap/src/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'repos',
          name: 'repos',
          builder: (context, state) => const ReposPage(),
          routes: [
            GoRoute(
              path: 'webpage',
              name: 'webpage',
              builder: (context, state) {
                final url = state.extra! as String;
                return ProfileWebpage(
                  url: url,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'commits',
          name: 'commits',
          builder: (context, state) => const CommitsPage(),
        ),
      ],
    ),
  ],
);
