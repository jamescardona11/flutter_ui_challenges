import 'package:chat_ui_flutter/models/user_model.dart';

class MessageModel {
  final UserModel sender;
  final String time;
  final String text;
  bool isLiked;
  final bool unread;

  MessageModel({
    required this.sender,
    required this.time,
    required this.text,
    this.isLiked = false,
    this.unread = false,
  });
}
