part of 'twitch_page_view.dart';

mixin _MixinTwitchPage<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  late final TwitchChatClient _client;

  void mixinInit({
    required String channelName,
    required String userNick,
    required String oauth,
  }) {
    _client = TwitchChatClient(
      channelName: channelName,
      userNick: userNick,
      oauth: oauth,
    );

    _afterBuild();
  }

  @override
  void dispose() {
    _client.dispose();
    super.dispose();
  }

  Future<void> _afterBuild() async {
    _client.connect();

    await Future.delayed(500.toDuration);

    _client.listenMessages?.listen((event) {
      MMessage? message = _client.convertToMessage(event.toString());
      if (message != null) ref.read(rMessages).addMessage(message);
    });
  }

  void _onSend(String text) {
    MMessage m = MMessage(
      message: text,
      senderName: "alikales1",
      sentAt: DateTime.now(),
    );

    _client.sendMessage(text);

    ref.read(rMessages).addMessage(m);
  }
}
