import 'package:flutter/material.dart';
import '../../../../consts/colors.dart';

class BookmarkIcon extends StatefulWidget {
  final Map<String, dynamic> movie;
  const BookmarkIcon({Key? key, required this.movie}) : super(key: key);
  @override
  _BookmarkIcon createState() => _BookmarkIcon();
}

class _BookmarkIcon extends State<BookmarkIcon> {
  SnackBar message = const SnackBar(
      content: Text('Movie bookmarked!'), duration: Duration(seconds: 2));
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: primaryBlack.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.white),
        ),
        child: IconButton(
          icon: Icon(
            widget.movie['bookmark']
                ? Icons.bookmark_added
                : Icons.bookmark_border,
            size: 24.0,
            color: primaryWhite,
          ),
          onPressed: () {
            setState(() {
              widget.movie['bookmark'] = !widget.movie['bookmark'];
            });
            if (widget.movie['bookmark']) {
              ScaffoldMessenger.of(context).showSnackBar(message);
            }
          },
        ));
  }
}
