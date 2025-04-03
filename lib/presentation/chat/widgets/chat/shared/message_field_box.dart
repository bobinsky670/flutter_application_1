import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
      hintText: "End your message with a " ?? " ",
      enabledBorder: borderStyle,
      focusedErrorBorder: borderStyle,
      filled: true,
      fillColor: colorScheme.surfaceVariant, // Color de fondo
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print("button: $textValue");
          textController.clear();
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration, // Se usa la decoración definida
      onFieldSubmitted: (value) {
        print("submit value $value");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
