import 'package:go_router/go_router.dart';
import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/core/c_shared_preferences.dart';
import 'package:twitch_app/core/models/m_user.dart';
import 'package:twitch_app/pages/main_page/no_auth/no_auth_view.dart';
import 'package:twitch_app/router.dart';
import 'package:twitch_app/settings.dart';
import 'package:twitch_app/styles/values.dart';

part 'mixin_page_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> with _MixinMainPage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twitch"),
      ),
      body: Padding(
        padding: Values.paddingPage(context),
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    if (!isAuthed) {
      return NoAuthView(
        onSignIn: onSignIn,
      );
    }

    return const Column();
  }
}
