import 'package:go_router/go_router.dart';
import 'package:twitch_app/pages/main_page/main_page_view.dart';
import 'package:twitch_app/pages/main_page/twitch_auth/twitch_auth_view.dart';
import 'package:twitch_app/pages/twitch_page/twitch_page_view.dart';

import 'common_libs.dart';

class PagePaths {
  static String main = "/main";
  static String twitchAuth = "/twitchAuth";
  static String twitch({
    required String channelName,
    required String userNick,
  }) =>
      "/twitch?channelName=$channelName&userNick=$userNick";
}

final appRouter = GoRouter(
  initialLocation: PagePaths.main,
  redirect: (context, state) {
    return null;
  },
  routes: [
    AppRoute(PagePaths.main, (s) => const MainPageView()),
    AppRoute(PagePaths.twitchAuth, (s) => const TwitchAuthView()),
    AppRoute(
      PagePaths.twitch.path,
      (s) => TwitchPageView(
        channelName: s.pathParameters['channelName'].toStringg!,
        userNick: s.pathParameters['userNick'].toStringg!,
      ),
    ),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder)
      : super(
          path: path,
          pageBuilder: (context, state) => MaterialPage(child: builder(state)),
        );
}
