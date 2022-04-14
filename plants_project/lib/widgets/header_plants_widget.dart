import 'package:flutter/material.dart';
import 'package:plants_project/pages/detail_plant_page.dart';
import 'package:plants_project/widgets/oval_clipper.dart';

import '../models/plant_model.dart';
import '../utils_plants.dart';

class HeaderPlantsWidget extends StatelessWidget {
  const HeaderPlantsWidget({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: OvalHeaderClipper(expand: true),
      child: Container(
        width: size.width,
        height: size.height * 0.43,
        color: greenPlantsColor,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Our Plants',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                plant.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Price: ${plant.price}', style: style14),
                    Text('|', style: style14),
                    Text('Size: ${plant.size}', style: style14),
                    Text('|', style: style14),
                    Text('Plant: ${plant.plant}', style: style14)
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPlantPage(
                            plantModel: plant,
                          ),
                        ));
                  },
                  child: Image.asset(plant.imageAsset),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get style14 => const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      );
}
