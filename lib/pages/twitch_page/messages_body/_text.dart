part of 'messages_body_view.dart';

class _Text extends StatelessWidget {
  const _Text({required this.message});

  final MMessage message;

  bool get _isMe {
    return message.senderName == Settings.user?.userNick;
  }

  @override
  Widget build(BuildContext context) {
    String senderName = message.senderName;
    String messageText = message.message;
    return Text.rich(
      TextSpan(
        text: "$senderName:\n",
        style: context.textTheme.titleLarge!.copyWith(
          color:
              _isMe ? context.colorScheme.error : context.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
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
