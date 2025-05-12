import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    final colorScheme =
        Theme.of(context).colorScheme; // Se cambió Colors por colorScheme

    final borderStyle = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: '"End your message with a " ?? "',
      enabledBorder: borderStyle,
      focusedErrorBorder: borderStyle,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print("button: $textValue");
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration, // Se usa la decoración definida
      onFieldSubmitted: (value) {
        
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
