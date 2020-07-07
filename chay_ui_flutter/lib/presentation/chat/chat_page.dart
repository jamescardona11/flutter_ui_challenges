import 'package:chay_ui_flutter/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final UserModel user;

  const ChatPage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Chat Page'),
      ),
    );
  }
}
