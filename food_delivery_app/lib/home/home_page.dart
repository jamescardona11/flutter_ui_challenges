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
            Positioned(
              top: 55,
              left: 100,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '@jamescardona11',
                        style: TextStyle(color: AppColors.greenColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 190,
                    height: 45,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.greenLightColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Search'), Icon(Icons.search)],
                    ),
                  ),
                ],
              ),
            ),
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
            ),
            Positioned(
              top: size.height * 0.4 + 130,
              left: 120,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: size.width * 0.7,
                      height: size.height,
                      child: ListView.builder(
                        itemCount: MockData.mockFoodModel.length,
                        itemBuilder: (context, index) => _BottomItemList(model: MockData.mockFoodModel[index]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BottomItemList extends StatelessWidget {
  final FoodModel model;

  const _BottomItemList({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.greenLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image(
            width: 85,
            image: AssetImage('assets/images/${model.imgPath}'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    model.priceTxt,
                    style: TextStyle(color: AppColors.redColor, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '(${model.calory.toString()} calories)',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ],
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
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '***** (120 review)',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Text(
                      model.name,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
            top: 25,
            right: 25,
            child: Image(
              width: 135,
              image: AssetImage('assets/images/${model.imgPath}'),
            ),
          ),
        ],
      ),
    );
  }
}
