import 'package:chay_ui_flutter/models/message_model.dart';
import 'package:chay_ui_flutter/models/user_model.dart';

class MockData {
  static final UserModel currentUser = UserModel(id: 0, name: 'Me', imageUrl: 'assets/images/greg.jpg');
  static final UserModel greg = UserModel(id: 1, name: 'Greg', imageUrl: 'assets/images/greg.jpg');
  static final UserModel james = UserModel(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');
  static final UserModel john = UserModel(id: 3, name: 'John', imageUrl: 'assets/images/john.jpg');
  static final UserModel olivia = UserModel(id: 4, name: 'Olivia', imageUrl: 'assets/images/olivia.jpg');
  static final UserModel sam = UserModel(id: 5, name: 'Sam', imageUrl: 'assets/images/sam.jpg');
  static final UserModel sophia = UserModel(id: 6, name: 'Sophia', imageUrl: 'assets/images/sophia.jpg');
  static final UserModel steven = UserModel(id: 7, name: 'Steven', imageUrl: 'assets/images/steven.jpg');

  static List<UserModel> favorites = [sam, steven, olivia, john, greg];
  static List<MessageModel> chats = [
    MessageModel(
      sender: olivia,
      time: '4:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: true,
    ),
    MessageModel(
      sender: john,
      time: '3:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: false,
    ),
    MessageModel(
      sender: james,
      time: '5:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: true,
    ),
    MessageModel(
      sender: sophia,
      time: '2:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: true,
    ),
    MessageModel(
      sender: steven,
      time: '1:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: false,
    ),
    MessageModel(
      sender: sam,
      time: '12:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: false,
    ),
    MessageModel(
      sender: greg,
      time: '11:30 AM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      unread: false,
    ),
  ];

  static List<MessageModel> messages = [
    MessageModel(
      sender: james,
      time: '5:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: true,
      unread: true,
    ),
    MessageModel(
      sender: currentUser,
      time: '4:30 PM',
      text: 'Just walked my doge. She was super duper cute. The best pupper!!',
      isLiked: false,
      unread: true,
    ),
    MessageModel(
      sender: james,
      time: '3:45 PM',
      text: 'How\'s the doggo?',
      isLiked: false,
      unread: true,
    ),
    MessageModel(
      sender: james,
      time: '3:15 PM',
      text: 'All the food',
      isLiked: true,
      unread: true,
    ),
    MessageModel(
      sender: currentUser,
      time: '2:30 PM',
      text: 'Nice! What kind of food did you eat?',
      isLiked: false,
      unread: true,
    ),
    MessageModel(
      sender: james,
      time: '2:00 PM',
      text: 'I ate so much food today.',
      isLiked: false,
      unread: true,
    ),
  ];
}
