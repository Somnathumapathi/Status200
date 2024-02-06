import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset('assets/car1.jpg'),
              Image.asset('assets/car2.jpg'),
              Image.asset('assets/car3.jpg')
            ],
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 2.0,
              enableInfiniteScroll: true,
            ),
          ),
          const SizedBox(height: 20),
          Text('Welcome to home'),
        ],
      ),
    );
  }
}
