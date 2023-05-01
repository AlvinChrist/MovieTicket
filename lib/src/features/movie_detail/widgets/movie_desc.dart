import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/src/features/movie_detail/widgets/starring.dart';

class MovieDesc extends StatelessWidget {
  final List<String> directors;
  final List<String> writers;
  final List<dynamic> starrings;
  final String desc;
  final String title;
  const MovieDesc(
      {Key? key,
      required this.title,
      required this.desc,
      required this.directors,
      required this.writers,
      required this.starrings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: primaryBlack,
          gradient: LinearGradient(
            end: const Alignment(0.0, -0.9),
            begin: const Alignment(0.0, -0.4),
            colors: (() {
              List<Color> colors = [];
              for (double i = 1; i >= 0; i -= 0.5) {
                colors.add(primaryBlack.withOpacity(i));
              }
              return colors;
            }()),
          )),
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, (MediaQuery.of(context).size.height - 85) * 0.3, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        desc,
                        style: const TextStyle(
                          color: primaryWhite,
                          fontSize: 14.0,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: <Widget>[
                    const Text('Director: '),
                    Text(
                      directors.join(','),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  children: <Widget>[
                    const Text('Writers: '),
                    Text(writers.join(", "),
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: primaryWhite,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Starring',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Starring(starrings: starrings),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )),
    ));
  }
}
