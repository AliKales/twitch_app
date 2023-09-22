part of 'messages_body_view.dart';

class _Text extends StatelessWidget {
  const _Text({required this.message});

  final MMessage message;

  @override
  Widget build(BuildContext context) {
    String senderName = message.senderName;
    String messageText = message.message;
    return Text.rich(
      TextSpan(
        text: "$senderName:\n",
        style: context.textTheme.titleLarge!.toBold,
        children: [
          TextSpan(
            text: messageText,
            style: context.textTheme.titleLarge!,
          ),
        ],
      ),
    );
  }
}
