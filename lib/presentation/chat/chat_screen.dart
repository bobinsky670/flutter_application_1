import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
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
                  //enlaza el controlador creado en chatProvider 
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                //instancia q sabra de qn es el mensaje
                final message = chatProvider.messageList[index];
                //si el residuo es 0 es de ella; si no es 0 es mio
                //si es par es de ella, si no es mio
               // return (index % 2 == 0)
                return (message.fromWho == FromWho.hers)
                    ? const HerMessageBubble()
                    : MyMessageBubble(message: message);
              },
            )),
             MessageFieldBox(
              onValue: chatProvider.sendMessage
               ),
          ],
        ),
      ),
    );
  }
}
