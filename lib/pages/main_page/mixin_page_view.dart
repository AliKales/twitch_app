part of 'main_page_view.dart';

mixin _MixinMainPage<T extends StatefulWidget> on State<T> {
  bool get isAuthed => Settings.user != null;

  Future<void> onSignIn() async {
    String? token = await context.push<String>(PagePaths.twitchAuth);

    if (token == null) return;

    MUser user = Settings.user ?? MUser();

    user.oauth = token;

    await _save(user);

    Settings.user = user;

    setState(() {});
  }

  Future<void> _save(MUser user) async {
    await CSharedPreferences.setMap(SPKeys.user, user.toJson());
  }
}
