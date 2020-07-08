import 'package:chay_ui_flutter/mock_data.dart';
import 'package:chay_ui_flutter/models/message_model.dart';
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
  final List<MessageModel> mockMessages = MockData.messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                  itemCount: mockMessages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _BuildMessageItem(message: mockMessages[index]);
                  },
                ),
              ),
            ),
          ),
          _BuildSendMessageBar(),
        ],
      ),
    );
  }
}

class _BuildSendMessageBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _BuildMessageItem extends StatelessWidget {
  final valueLiked = ValueNotifier<bool>(false);

  final MessageModel message;

  _BuildMessageItem({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.sender.id == 0;
    valueLiked.value = message.isLiked;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: MediaQuery.of(context).size.width * (isMe ? 0.75 : 1),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: isMeDecoration(isMe, context),
                constraints: BoxConstraints(
                  minHeight: 85,
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      message.time,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      message.text,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              isMe
                  ? SizedBox()
                  : Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: valueLiked,
                        builder: (_, value, __) => IconButton(
                          onPressed: () {
                            message.isLiked = !value;
                            valueLiked.value = !value;
                          },
                          icon: Icon(
                            message.isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration isMeDecoration(bool isMe, BuildContext context) {
    return BoxDecoration(
      color: isMe ? Theme.of(context).accentColor : Color(0xffFFEFEE),
      borderRadius: isMe
          ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
          : BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
    );
  }
}
