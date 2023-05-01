import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        color: Color.fromARGB(255, 46, 51, 61)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget> [
          Icon(Icons.search,
            color: Color.fromARGB(255, 105, 107, 108),
          ),
          Expanded(
            child: TextField(
              cursorColor: Color.fromARGB(255, 105, 107, 108),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17,color: Color.fromARGB(255, 105, 107, 108)),
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
              ),
            )
          )
        ],
      ),
    );
  }
}