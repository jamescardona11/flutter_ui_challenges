import 'package:flutter/material.dart';
import 'package:plants_project/utils_plants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Explore More',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 15),
        Container(
          width: size.width * 0.6,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Search |',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 14, color: greenPlantsColor),
                ),
                Icon(
                  Icons.search,
                  color: greenPlantsColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
