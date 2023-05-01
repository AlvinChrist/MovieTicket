import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/data.dart';
import 'package:movie_ticket/src/features/movie_detail/screens/detail.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate((context, index) {
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
                                movie: movieDesc[index], index: index)));
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.asset(movieDesc[index]['img'],
                          fit: BoxFit.fitHeight, width: 1000.0),
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
                            movieDesc[index]['title'],
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        }, childCount: movieDesc.length));
  }
}
