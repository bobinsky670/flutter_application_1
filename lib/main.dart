import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/app_theme.dart';
import 'package:flutter_application_1/presentation/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yes No App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme( selectedColor: 5).theme(),
      home: const ChatScreen()
    );
  }
}
