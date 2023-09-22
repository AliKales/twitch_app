import 'package:twitch_app/common_libs.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    super.key,
    required this.controller,
    this.hintText,
  });

  final TextEditingController controller;
  final String? hintText;

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: context.width,
        maxWidth: context.width,
        maxHeight: 0.2.toDynamicHeight(context),
      ),
      child: TextField(
        controller: widget.controller,
        textCapitalization: TextCapitalization.sentences,
        maxLines: null,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
