import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';

class BackIconButton extends StatelessWidget {
  final BuildContext targetContext;
  const BackIconButton({Key? key, required this.targetContext})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.chevron_left,
        size: 32.0,
        color: primaryWhite,
      ),
      onPressed: () {
        Navigator.pop(targetContext);
      },
    );
  }
}
