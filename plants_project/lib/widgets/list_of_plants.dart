import 'package:flutter/material.dart';
import 'package:plants_project/models/plant_model.dart';
import 'package:plants_project/pages/detail_plant_page.dart';
import 'package:plants_project/utils_plants.dart';

class ListOfPlantsWidget extends StatelessWidget {
  const ListOfPlantsWidget({
    Key? key,
    required this.listOfPlants,
  }) : super(key: key);

  final List<PlantModel> listOfPlants;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView.builder(
        itemCount: listOfPlants.length - 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final plantItem = listOfPlants[index + 1];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPlantPage(
                      plantModel: listOfPlants[index + 1],
                    ),
                  ));
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    width: 130,
                    height: 140,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: greenPlantsColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          plantItem.plant,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          '\$${plantItem.price}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  plantItem.imageAsset,
                  height: 160,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
