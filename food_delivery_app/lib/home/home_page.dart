import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts.dart';
import 'package:food_delivery_app/mockData.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/widgets/leftbar_layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            LeftBarLayout(),
            Positioned(
              top: 100,
              right: 0,
              child: Container(
                width: size.width * 0.7,
                height: size.height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MockData.mockFoodModel.length,
                  itemBuilder: (context, index) => _TopViewPagerItems(
                    model: MockData.mockFoodModel[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TopViewPagerItems extends StatelessWidget {
  final FoodModel model;

  const _TopViewPagerItems({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.55,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.3,
              //margin: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 30,
            child: Container(
              width: 60,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  model.priceTxt,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image(
              width: 150,
              image: AssetImage('assets/images/${model.imgPath}'),
            ),
          ),
        ],
      ),
    );
  }
}
