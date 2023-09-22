import 'package:twitch_app/common_libs.dart';
import 'package:twitch_app/pages/twitch_page/text_field_layer/message_text_field.dart';
import 'package:twitch_app/pages/twitch_page/text_field_layer/send_button.dart';

class TextFieldLayerView extends StatefulWidget {
  const TextFieldLayerView({
    super.key,
    required this.onSend,
  });

  final void Function(String messageText) onSend;

  @override
  State<TextFieldLayerView> createState() => _TextFieldLayerViewState();
}

class _TextFieldLayerViewState extends State<TextFieldLayerView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSend() {
    if (_controller.textTrim.isEmpty) return;
    widget.onSend.call(_controller.textTrim);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: MessageTextField(
              controller: _controller,
              hintText: "Mesaj..",
            ),
          ),
          SendButton(
            onPressed: _onSend,
          ),
        ],
      ),
    );
  }
}
