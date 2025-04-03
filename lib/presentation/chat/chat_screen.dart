import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/chat/widgets/chat/my_message_bubble.dart';

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
                "https://media2.giphy.com/media/LHZyixOnHwDDy/200w.gif?cid=6c09b952a84cus7kti2ypjtxa2dcqxud5ly67x2h3s70xiq9&ep=v1_gifs_search&rid=200w.gif&ct=g"),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [

            Expanded(child: ListView.builder(
              itemCount: 100,

              itemBuilder: (context, index) {
                return const MyMessageBubble();
              },
            )),
            Text("Peeeelana")
          ],
        ),
      ),
    );
  }
}
