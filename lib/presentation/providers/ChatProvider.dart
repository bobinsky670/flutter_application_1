import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class Chatprovider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.me,),
    Message(text: "ok", fromWho: FromWho.me,)
  ];
}
