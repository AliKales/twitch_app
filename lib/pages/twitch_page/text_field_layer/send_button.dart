import 'package:twitch_app/common_libs.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: const Icon(Icons.send),
    );
  }
}
