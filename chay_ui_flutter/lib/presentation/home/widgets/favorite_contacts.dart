import 'package:chay_ui_flutter/models/user_model.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  final List<UserModel> favorite;

  const FavoriteContacts({
    Key key,
    @required this.favorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite Contacts',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favorite.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(favorite[index].imageUrl),
                      backgroundColor: Theme.of(context).accentColor,
                      child: favorite[index].imageUrl.isNotEmpty
                          ? null
                          : Text(
                              favorite[index].firstLetters,
                              style: TextStyle(
                                  fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                            ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      favorite[index].name,
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
