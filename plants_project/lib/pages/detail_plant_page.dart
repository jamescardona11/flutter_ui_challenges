import 'package:flutter/material.dart';
import 'package:plants_project/models/plant_model.dart';
import 'package:plants_project/utils_plants.dart';
import 'package:plants_project/widgets/button_description_widget.dart';
import 'package:plants_project/widgets/description_widget.dart';
import 'package:plants_project/widgets/header_detail_widget.dart';
import 'package:plants_project/widgets/rating_bar_description_widget.dart';

class DetailPlantPage extends StatelessWidget {
  const DetailPlantPage({
    Key? key,
    required this.plantModel,
  }) : super(key: key);

  final PlantModel plantModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderDetailWidget(),
          const SizedBox(height: 25),
          RatingBarWidget(plantModel: plantModel),
          const SizedBox(height: 20),
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.25),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage(plantModel.imageAsset),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                right: -20,
                child: Container(
                  width: size.width / 2,
                  height: 65,
                  decoration: const BoxDecoration(
                    color: greenPlantsColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                  ),
                  child: Center(
                    child: Text('Price \$${plantModel.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
            ],
          ),
          const DescriptionWidget(),
          const Expanded(child: ButtonDescriptionWidget()),
        ],
      ),
    );
  }
}
