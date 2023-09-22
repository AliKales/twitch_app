import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/core/models/m_message.dart';
import 'package:twitch_app/core/riverpods/r_messages.dart';

part '_text.dart';

class MessagesBodyView extends StatefulWidget {
  const MessagesBodyView({super.key});

  @override
  State<MessagesBodyView> createState() => _MessagesBodyViewState();
}

class _MessagesBodyViewState extends State<MessagesBodyView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<MMessage> messages = ref.watch(rMessages).getMessages;
        return ListView.separated(
          reverse: true,
          itemCount: messages.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            MMessage m = messages[index];
            return _Text(
              message: m,
            );
          },
        );
      },
    );
  }
}
