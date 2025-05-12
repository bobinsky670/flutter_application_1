import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class Chatprovider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(
      text: "Hola",
      fromWho: FromWho.me,
    ),
  
    Message(
      text: "ok",
      fromWho: FromWho.me,
    )
  ];
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agregar mensaje a la lista
    messageList.add(newMessage);
    //notifica a provider que algo cambió
    print('Cantidad de mensajes: ${messageList.length}'); 
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
