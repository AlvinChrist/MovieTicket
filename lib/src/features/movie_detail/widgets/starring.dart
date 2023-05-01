import 'package:flutter/cupertino.dart';

class Starring extends StatelessWidget {
  final List<dynamic> starrings;
  const Starring({Key? key, required this.starrings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: starrings.length,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/starring/${starrings[index]['name']}.jpg',
                      width: 50,
                      height: 50,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(starrings[index]['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(starrings[index]['characterName'])
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            );
          }),
    );
  }
}
