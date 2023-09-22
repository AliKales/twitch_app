part of 'authed_view.dart';

mixin _MixinAuthedView<T extends StatefulWidget> on State<T> {
  late TextEditingController controllerNick;
  final TextEditingController controllerChannel = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerNick = TextEditingController(text: Settings.user?.userNick);
  }

  void search() {
    final userNick = controllerNick.textTrim;
    final channelNick = controllerChannel.textTrim;

    bool isContinue;

    isContinue = _textController(
        userNick, "Lütfen Twitch nick'inizi doğru biçimde giriniz!");

    if (!isContinue) return;

    isContinue = _textController(
        channelNick, "Lütfen katılmak istediğiniz kanalın nick'ini giriniz!");

    if (!isContinue) return;

    _setUsername(userNick);

    context.push(PagePaths.twitch(
      channelName: channelNick,
      userNick: userNick,
      oauth: Settings.user!.oauth!,
    ));
  }

  bool _textController(String text, String errorMessage) {
    if (text.isNotEmpty) return true;

    CustomDialog.showCustomDialog(context, title: "ERROR", text: errorMessage);

    return false;
  }

  void _setUsername(String userNick) {
    if (Settings.user?.userNick != null) return;

    Settings.user?.userNick = userNick;

    CSharedPreferences.setMap(SPKeys.user, Settings.user!.toJson());
  }
}
