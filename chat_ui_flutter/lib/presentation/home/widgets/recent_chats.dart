import 'package:chay_ui_flutter/mock_data.dart';
import 'package:chay_ui_flutter/models/message_model.dart';
import 'package:chay_ui_flutter/models/user_model.dart';
import 'package:chay_ui_flutter/presentation/chat/chat_page.dart';
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
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: ListView.builder(
        itemCount: recentChats.length,
        itemBuilder: (BuildContext context, int index) => _RecentItemChat(chatInfo: recentChats[index]),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(user: chatInfo.sender)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: chatInfo.unread ? Color(0xFFFFEFEE) : Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatarApp(
                  imageUrl: chatInfo.sender.imageUrl,
                  nameLetter: chatInfo.sender.firstLetters,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      chatInfo.sender.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        chatInfo.text,
                        style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  chatInfo.time,
                  style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                chatInfo.unread
                    ? Container(
                        width: 40.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'NEW',
                          style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
