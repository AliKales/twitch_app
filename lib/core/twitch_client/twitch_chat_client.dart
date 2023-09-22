import 'package:twitch_app/core/models/m_message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

//https://hablo-app.web.app/#
//access_token=fcx651sd26n0rwgcks1doo9ro4ds3b
//&scope=chat%3Aread+chat%3Aedit&token_type=bearer

class TwitchChatClient {
  TwitchChatClient({
    required this.channelName,
    required this.userNick,
  });

  final String channelName;
  final String userNick;

  WebSocketChannel? _channel;

  Stream? get listenMessages => _channel?.stream;

  void dispose() {
    _channel?.sink.close();
  }

  Future<void> connect() async {
    _channel =
        WebSocketChannel.connect(Uri.parse('ws://irc-ws.chat.twitch.tv:80'));

    _addSink("PASS oauth:fcx651sd26n0rwgcks1doo9ro4ds3b");
    _addSink("NICK $userNick");
    _addSink("JOIN #$channelName");
  }

  void _addSink(String param) {
    _channel?.sink.add('$param\r\n');
  }

  void sendMessage(String message) {
    _channel?.sink.add('PRIVMSG #$channelName :$message\r\n');
  }

  MMessage? convertToMessage(String data) {
    if (!data.contains("PRIVMSG")) {
      return null;
    }

    final exclamationMark = data.indexOf("!");

    final senderName = data.substring(1, exclamationMark);

    final colonLast = data.lastIndexOf(":");

    final message = data.substring(colonLast + 1, data.length);

    return MMessage(
      message: message,
      senderName: senderName,
      sentAt: DateTime.now(),
    );
  }
}
