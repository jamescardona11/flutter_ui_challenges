import 'package:chay_ui_flutter/mock_data.dart';
import 'package:chay_ui_flutter/presentation/home/widgets/category_selector.dart';
import 'package:chay_ui_flutter/presentation/home/widgets/favorite_contacts.dart';
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
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  FavoriteContacts(
                    favorite: MockData().favorites,
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
