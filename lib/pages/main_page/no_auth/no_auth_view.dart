import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/styles/values.dart';

class NoAuthView extends StatelessWidget {
  const NoAuthView({
    super.key,
    required this.onSignIn,
  });

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _heightSmallXX(context),
        Text(
          "Read the chat\nListen to messages",
          style: context.textTheme.displayMedium!.toBold,
        ),
        const Spacer(),
        FilledButton(
          onPressed: onSignIn,
          child: const Text("SIGN IN").toBoldWhite,
        ),
        const Spacer(),
        _heightSmallXX(context),
      ],
    );
  }

  Widget _heightSmallXX(BuildContext context) =>
      context.sizedBox(height: Values.paddingHeightSmallXX);
}
