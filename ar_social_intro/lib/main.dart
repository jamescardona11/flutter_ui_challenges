import 'package:ar_social_intro/voices_orbit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_bar.dart';

// inspired by https://dribbble.com/shots/21664250-AR-Based-Social-Network-App

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8E6FF),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Stack(
          children: [
            const Positioned(
              top: 30,
              left: -130,
              child: SizedBox(
                width: 250,
                height: 250,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xffFB873A),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const Positioned(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: VoicesOrbit(),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 20,
              child: Text(
                'Let\'s start your\njourney',
                style: GoogleFonts.anton(
                  color: const Color(0xff191168),
                  fontSize: 54,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            AppBarWidget(
              onTapBack: () {},
              title: Text(
                'CircleUp',
                style: GoogleFonts.anton(
                  color: const Color(0xff191168),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff191168)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      // backgroundColor: const Color(0xff191168),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.anton(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        // letterSpacing: 1.2,
                      ),
                    ),
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
