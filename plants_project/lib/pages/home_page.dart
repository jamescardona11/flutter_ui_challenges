import 'package:flutter/material.dart';
import 'package:plants_project/models/plant_model.dart';
import 'package:plants_project/utils_plants.dart';

import '../widgets/circular_button_widget.dart';
import '../widgets/header_plants_widget.dart';
import '../widgets/list_of_plants.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              HeaderPlantsWidget(plant: listOfPlants[0]),
              Positioned(
                bottom: 10,
                left: size.width * 0.1,
                child: CircularButtonWidget(
                  back: true,
                  onPressed: () {},
                ),
              ),
              Positioned(
                bottom: 10,
                right: size.width * 0.1,
                child: CircularButtonWidget(
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SearchWidget(),
          Expanded(
            child: ListOfPlantsWidget(
              listOfPlants: listOfPlants,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: greenPlantsColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            Icon(
              Icons.store_mall_directory,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.expand,
              color: Colors.white,
            ),
            CircleAvatar(
              radius: 18.0,
              backgroundImage: ExactAssetImage('assets/profile1.jpg'),
            )
          ],
        ),
      ),
    );
  }
}
