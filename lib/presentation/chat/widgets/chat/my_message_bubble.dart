import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  //variable de la identidada atomica message
  final Message message;
  const MyMessageBubble({super.key, 
  //se añade la variable al constructor
  required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
         SizedBox(
          height: 3,
        )
      ],
    );
  }
}
