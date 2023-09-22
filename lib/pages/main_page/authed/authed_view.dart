import 'package:go_router/go_router.dart';
import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/core/c_shared_preferences.dart';
import 'package:twitch_app/router.dart';
import 'package:twitch_app/settings.dart';
import 'package:uikit/widget/index.dart';

part 'mixin_authed_view.dart';

class AuthedView extends StatefulWidget {
  const AuthedView({super.key});

  @override
  State<AuthedView> createState() => _AuthedViewState();
}

class _AuthedViewState extends State<AuthedView> with _MixinAuthedView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controllerNick,
          decoration: const InputDecoration(
            labelText: "My Twitch nickname",
          ),
        ),
        TextField(
          controller: controllerChannel,
          decoration: const InputDecoration(
            labelText: "Twitch channel",
          ),
        ),
        const Spacer(),
        FilledButton(
          onPressed: search,
          child: const Text("SEARCH").toBoldWhite,
        ),
        const Spacer(),
      ],
    );
  }
}
