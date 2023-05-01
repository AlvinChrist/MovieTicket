import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/features/home/widgets/search_bar.dart';
import 'package:movie_ticket/consts/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Welcome Alvin',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'What movie are we going to see today?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: primaryOrange,
                    child: Text('A', style: TextStyle(color: primaryWhite)),
                  )
                ]),
            const SizedBox(
              height: 25,
            ),
            const MySearchBar()
          ],
        ));
  }
}
