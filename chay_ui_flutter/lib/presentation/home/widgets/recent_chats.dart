import 'package:chay_ui_flutter/mock_data.dart';
import 'package:chay_ui_flutter/models/message_model.dart';
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
      itemBuilder: (BuildContext context, int index) => Text(
        recentChats[index].sender.name,
      ),
    );
  }
}
