import 'package:go_router/go_router.dart';
import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/keys.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TwitchAuthView extends StatefulWidget {
  const TwitchAuthView({super.key});

  @override
  State<TwitchAuthView> createState() => _TwitchAuthViewState();
}

class _TwitchAuthViewState extends State<TwitchAuthView> {
  final RegExp _regex = RegExp(r'access_token=([^&]+)');

  late WebViewController _webViewController;

  String get _getTwitchAuthURL =>
      "https://id.twitch.tv/oauth2/authorize?response_type=token&client_id=$TWITCH_CLIENT_ID&redirect_uri=https://hablo-app.web.app&scope=chat%3Aread+chat%3Aedit";

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            if (url.contains("access_token")) {
              _handleRedirect(url);
            }
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(_getTwitchAuthURL));
  }

  void _handleRedirect(String url) {
    String? token = _regex.stringMatch(url);

    token = token?.replaceAll("access_token=", "");

    context.pop(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sing In"),
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
