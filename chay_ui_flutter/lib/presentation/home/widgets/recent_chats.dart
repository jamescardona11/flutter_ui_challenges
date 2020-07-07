import 'package:chay_ui_flutter/mock_data.dart';
import 'package:chay_ui_flutter/models/message_model.dart';
import 'package:chay_ui_flutter/models/user_model.dart';
import 'package:chay_ui_flutter/presentation/widgets/circle_avatar_app.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  final List<MessageModel> recentChats;

  const RecentChats({
    Key key,
    @required this.recentChats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recentChats.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: _RecentItemChat(chatInfo: recentChats[index]),
      ),
    );
  }
}

class _RecentItemChat extends StatelessWidget {
  final MessageModel chatInfo;

  const _RecentItemChat({
    Key key,
    @required this.chatInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatarApp(
        imageUrl: chatInfo.sender.imageUrl,
        nameLetter: chatInfo.sender.firstLetters,
      ),
    );
  }
}
