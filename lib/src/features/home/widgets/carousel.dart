import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/data.dart';

import '../../movie_detail/screens/detail.dart';

final imageSliders = movieDesc.asMap().entries.map((entry) {
  return Builder(
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: GestureDetector(
              onTapUp: (details) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetail(
                              movie: entry.value,
                              index: entry.key,
                            )));
              },
              child: Stack(
                children: <Widget>[
                  Image.asset(entry.value['img'],
                      fit: BoxFit.fill, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        entry.value['title'],
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    },
  );
}).toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 8),
            viewportFraction: 0.7,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            // scrollPhysics: const RangeMaintainingScrollPhysics(),
            aspectRatio: 1,
            pageSnapping: false,
          ),
        ),
      )
    ]);
  }
}
