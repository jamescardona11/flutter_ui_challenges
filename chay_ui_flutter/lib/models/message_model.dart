import 'package:chay_ui_flutter/models/user_model.dart';

class MessageModel {
  final UserModel sender;
  final String time;
  final String text;
  bool isLiked;
  final bool unread;

  MessageModel({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}
