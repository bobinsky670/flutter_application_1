import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/chat/widgets/chat/her_message_bubble.dart';
import 'package:flutter_application_1/presentation/chat/widgets/chat/my_message_bubble.dart';
import 'package:flutter_application_1/presentation/chat/widgets/chat/shared/message_field_box.dart';
import 'package:flutter_application_1/presentation/providers/ChatProvider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.tenor.com/o6x1_Z69E_4AAAAM/zayn-zaynmalik.gif'),
          ),
        ),
        title: Text("mi amor"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Le pide qe este pendiene de cambios
    final chatProvider = context.watch<Chatprovider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
