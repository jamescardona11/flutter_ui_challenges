import 'package:chay_ui_flutter/models/user_model.dart';

class MessageModel {
  final UserModel sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  const MessageModel({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}
