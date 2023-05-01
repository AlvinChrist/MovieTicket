import 'dart:convert';

import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../consts/data.dart';

class RowSeat extends StatefulWidget{
  final int index;
  late final List<dynamic> seats = json.decode(json.encode(seat[index]));
  RowSeat({Key? key, required this.index, this.emitChanges}) : super(key: key);
  final Function(int num)? emitChanges;

  @override
  State<RowSeat> createState() => RowSeatState();
}

class RowSeatState extends State<RowSeat> {
  List<String> selectedSeats = [];
  getSelectedSeats() => selectedSeats;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.33  * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (var i = 0; i < widget.seats.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              for(var j = 0; j < widget.seats[i].length; j++)
              Seat(
                state: widget.seats[i][j],
                seat: '${row[i]}${j+1}',
                emitEvent: (val){
                  if(widget.seats[i][j] >= 0){
                    String s = '${row[i]}${j+1}';
                    int pos = selectedSeats.indexOf(s);
                    widget.seats[i][j] = val;
                    if(val == 1 && pos == -1){
                      selectedSeats.add('${row[i]}${j+1}');
                    }
                    else{
                      selectedSeats.removeAt(pos);
                    }
                    widget.emitChanges!(getSelectedSeats().length);
                  }
                },
              )
            ]
          ),
        ],
      )
    );
  }
}

class Seat extends StatefulWidget {
  final int state;
  final String seat;
  final Function(int num)? emitEvent;
  const Seat({Key? key, required this.state, required this.seat, required this.emitEvent}) : super(key: key);

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  int _state = 0;
  @override
  void initState(){
    _state = widget.state;
    super.initState();
  }
  @override
  Widget build (BuildContext context){
    return InkWell(
      onTap: (){
        if(_state == 0){
          _state = 1;
          setState(() {
            widget.emitEvent!(_state);
          });
        }
        else if(_state == 1){
          _state = 0;
          setState(() {
            widget.emitEvent!(_state);
          });
        }
      },
      child: Container(
        width: 35,
        height: 35,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: (_state >= 0) ? (_state == 1) ? primaryGold : primaryGrey : darkOrange
          // color: (state)?
        ),
        child: Center(
          child: Text(widget.seat,
            style: const TextStyle(
              fontWeight: FontWeight.w600
            )
          )
        )
      ),
    );
  }
}