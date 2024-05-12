import 'package:chat_ui_flutter/mock_data.dart';
import 'package:chat_ui_flutter/presentation/home/widgets/category_selector.dart';
import 'package:chat_ui_flutter/presentation/home/widgets/favorite_contacts.dart';
import 'package:chat_ui_flutter/presentation/home/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //static const String pageRoute = 'home_page_route_id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _homeAppBar(),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFEF9EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  FavoriteContacts(favorite: MockData.favorites),
                  Expanded(
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: RecentChats(recentChats: MockData.chats),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: Text(
        'Chats',
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
