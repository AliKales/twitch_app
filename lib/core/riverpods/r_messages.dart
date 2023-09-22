import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/core/models/m_message.dart';

class RMessages extends ChangeNotifier {
  final List<MMessage> _messages = [];

  List<MMessage> get getMessages => _messages;

  void addMessage(MMessage m) {
    _messages.insert(0, m);

    notifyListeners();
  }
}

final rMessages =
    ChangeNotifierProvider.autoDispose<RMessages>((ref) => RMessages());
