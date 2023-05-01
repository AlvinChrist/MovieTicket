import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/src/common_widgets/back_button_icon.dart';
import 'package:movie_ticket/src/features/movie_detail/widgets/bookmark_icon.dart';
import 'package:movie_ticket/src/features/movie_detail/widgets/movie_desc.dart';
import 'package:movie_ticket/src/features/reservation/screens/reservation.dart';

class MovieDetail extends StatefulWidget {
  final int index;
  final Map<String, dynamic> movie;
  const MovieDetail({Key? key, required this.movie, required this.index})
      : super(key: key);
  @override
  State<MovieDetail> createState() => _MovieDetail();
}

class _MovieDetail extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: primaryBlack,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(widget.movie['img']),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Movie Poster
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryBlack.withOpacity(0.7),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: BackIconButton(targetContext: context)),
                  BookmarkIcon(movie: widget.movie)
                ],
              ),
            ),
            // Movie
            MovieDesc(
                title: widget.movie['title'],
                desc: widget.movie['desc'],
                directors: widget.movie['director'],
                writers: widget.movie['writer'],
                starrings: widget.movie['starring']),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // inspect(movie);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Reservation(
                                  movie: widget.movie, index: widget.index)));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryGold),
                    ),
                    child: const Text('Reservation',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
