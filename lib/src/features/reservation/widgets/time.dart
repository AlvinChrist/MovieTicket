import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';

class Time extends StatefulWidget{
  final List<String> timeList = ['13:30','15:30','17:30','21:30','23:30'];
  final Function(String selectedTime)? onTimeChange;
  Time({Key? key, this.onTimeChange}) : super(key: key);

  @override
  State<Time> createState() => _Time();
}

class _Time extends State<Time> {
  String selected = '';
  @override
  void initState(){
    selected = widget.timeList[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    // print('Time Build');
    return ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.max,
              children: widget.timeList.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: MyButton(
                    text: item,
                    selected: item == selected,
                    onPressed: (){
                      if(item != selected){
                        setState((){
                          selected = item;
                          widget.onTimeChange!(item);
                        });
                      }
                    },
                  ),
                );
              }).toList()
            )
          )
        ],
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool selected;
  const MyButton({Key? key, required this.text, this.onPressed, required this.selected}) : super(key: key);
  final LinearGradient defaultGradient = const  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.center,
    colors: [Color.fromARGB(255, 44, 48, 58), primaryGrey]
  );
  final LinearGradient selectedGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.center,
    colors: [Color.fromARGB(255, 219, 175, 103), primaryGold]
  );

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        // color: primaryGrey
        gradient: (selected)?selectedGradient : defaultGradient
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style:ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child:Text(text,
          style: const TextStyle(
            color: primaryWhite,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        )
      ),
    );
  }
}