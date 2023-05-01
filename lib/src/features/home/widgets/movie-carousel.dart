import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/src/features/home/widgets/carousel.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 30, bottom: 15),
          child: Text('Showing this month',
              style: TextStyle(
                  color: primaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
        ),
        Row(children: [
          Expanded(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: const CarouselWithIndicatorDemo()),
          )
        ]),
      ],
    );
  }
}
