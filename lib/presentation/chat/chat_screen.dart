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
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media.tenor.com/o6x1_Z69E_4AAAAM/zayn-zaynmalik.gif'),
          ),
        ),
        title: Text('mi amor'),
        centerTitle: false,
        ),
        body: _ChatView(),
        );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {           
                  //instancia que sabra de quien es el mensaje       
                  final message = chatProvider.messageList[index];
                  //si el residuo es 0 es della si no es 0 es mio
                  //si es par es de ella, si es impar es el mio
                  return(message.fromWho == FromWho.hers)
                  ?  HerMessageBubble(message : message)
                  :  MyMessageBubble(message: message);
                 },)
               ),
           
        //caja de texto
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
        
          ],
        ),
      ),
    );
  }
}