import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/src/features/home/widgets/categories.dart';
import 'package:movie_ticket/src/features/home/widgets/header.dart';
import 'package:movie_ticket/src/features/home/widgets/movie-carousel.dart';
import 'package:movie_ticket/src/features/home/widgets/movie_list.dart';
import 'package:movie_ticket/src/features/home/widgets/notify_updates.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: primaryBlack,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Header(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 70,
                  child: Categories(),
                ),
              ),
              const SliverToBoxAdapter(
                child: MovieCarousel(),
              ),
              const SliverToBoxAdapter(
                child: NotifyUpdates(),
              ),
              const MovieList()
            ],
          )),
    );
  }
}
