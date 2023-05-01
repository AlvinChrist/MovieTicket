import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/consts/data.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  final Map<String,dynamic> categories = json.decode(json.encode(movieCategories));

  void toggle(String category, bool value) {
    categories[category] = value;
  }
  @override
  Widget build(BuildContext context){
    toggle(categories.entries.elementAt(0).key,true);
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30),
          child: Row(
            children: categories.entries.map((e) {
              return MyButton(
                text: e.key,  
                state: e.value,
                onChangeState: (val){
                  toggle(e.key,val);
                },
              );
            }).toList(),
          )
        )
      ]
    );
  }
}

class MyButton extends StatefulWidget {
  final String text;
  final bool state;
  final Function(bool state)? onChangeState;
  const MyButton({Key? key, required this.text, required this.state, this.onChangeState}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _state = false;
  @override
  void initState(){
    _state = widget.state;
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: FilterChip(
        label: Text(widget.text,
          style: const TextStyle(
            color: primaryWhite,
            fontWeight: FontWeight.bold
          ),
        ),
        selectedColor: primaryOrange,
        selected: _state,
        backgroundColor: const Color.fromARGB(255, 46, 51, 61),
        shadowColor: Colors.black,
        onSelected: (value) {
          setState(() {
            _state = value;
            widget.onChangeState!(value);
          });
        }
      ),
    );
  }
}