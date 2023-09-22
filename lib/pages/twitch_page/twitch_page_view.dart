import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/core/models/m_message.dart';
import 'package:twitch_app/core/riverpods/r_messages.dart';
import 'package:twitch_app/core/twitch_client/twitch_chat_client.dart';
import 'package:twitch_app/styles/values.dart';

import 'messages_body/messages_body_view.dart';
import 'text_field_layer/text_field_layer_view.dart';

part 'mixin_twitch_page.dart';

class TwitchPageView extends ConsumerStatefulWidget {
  const TwitchPageView({
    super.key,
    required this.channelName,
    required this.userNick,
  });

  final String channelName;
  final String userNick;

  @override
  ConsumerState<TwitchPageView> createState() => _TwitchPageViewState();
}

class _TwitchPageViewState extends ConsumerState<TwitchPageView>
    with _MixinTwitchPage {
  @override
  void initState() {
    super.initState();
    context.afterBuild((p0) =>
        mixinInit(channelName: widget.channelName, userNick: widget.userNick));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.channelName),
      ),
      body: Padding(
        padding: Values.paddingPage(context),
        child: Column(
          children: [
            const Expanded(
              child: MessagesBodyView(),
            ),
            context.sizedBox(height: Values.paddingHeightSmallXX),
            TextFieldLayerView(
              onSend: _onSend,
            ),
          ],
        ),
      ),
    );
  }
}
