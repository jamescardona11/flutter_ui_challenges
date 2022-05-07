import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class BlackViewPage extends StatelessWidget {
  /// default constructor
  const BlackViewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.share,
              color: Colors.grey,
            ),
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 8),
            child: Icon(
              Icons.more_horiz,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff021522),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DotStepper(
                dotCount: 3,
                dotRadius: 20,
                activeStep: 1,
                shape: Shape.pipe,
                spacing: 20,
                indicator: Indicator.shift,
                onDotTapped: (tappedDotIndex) {},
                fixedDotDecoration: FixedDotDecoration(
                  color: Colors.grey,
                ),
                indicatorDecoration: IndicatorDecoration(
                  color: Colors.white,
                ),
                lineConnectorDecoration: LineConnectorDecoration(
                  color: Colors.grey,
                  strokeWidth: 0,
                ),
              ),
              Container(
                child: CircleAvatar(
                  radius: (size.width) / 2 - 30,
                  backgroundImage: AssetImage('assets/image1.jpg'),
                ),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 38,
                        backgroundImage: AssetImage('assets/image1.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/image2.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '+10',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Miami Beach',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'South Florida Island',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$349',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    '(4 Days)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyIconWidget(
                    image: 'assets/star.png',
                    label: '4.8',
                    description: '2k reviews',
                  ),
                  MyIconWidget(
                    image: 'assets/placeholder.png',
                    label: '7km',
                    description: 'Direction',
                  ),
                  MyIconWidget(
                    image: 'assets/thermometer.png',
                    label: '25°C',
                    description: 'Sunny',
                  ),
                ],
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyIconWidget extends StatelessWidget {
  /// default constructor
  const MyIconWidget({
    Key? key,
    required this.image,
    required this.label,
    required this.description,
  }) : super(key: key);

  final String image;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              image,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
