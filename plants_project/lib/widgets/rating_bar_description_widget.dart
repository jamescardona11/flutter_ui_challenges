import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plants_project/models/plant_model.dart';
import 'package:plants_project/utils_plants.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
    required this.plantModel,
  }) : super(key: key);

  final PlantModel plantModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const _RatingWidget(),
        _ElementWidget(
          header: 'Family',
          value: plantModel.plant,
        ),
        _ElementWidget(
          header: 'Size',
          value: plantModel.size,
        ),
        _ElementWidget(
          header: 'Category',
          value: plantModel.category,
        ),
      ],
    );
  }
}

class _ElementWidget extends StatelessWidget {
  const _ElementWidget({
    Key? key,
    required this.header,
    required this.value,
  }) : super(key: key);

  final String header;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: greenPlantsColor,
          ),
        ),
      ],
    );
  }
}

class _RatingWidget extends StatelessWidget {
  const _RatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        RatingBar.builder(
          itemSize: 15,
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
