import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/consts/colors.dart';

class NotifyUpdates extends StatefulWidget {
  const NotifyUpdates({Key? key}) : super(key: key);

  @override
  @override
  State<NotifyUpdates> createState() => _NotifyUpdates();
}

class _NotifyUpdates extends State<NotifyUpdates> {
  bool notifyMe = false;

  @override
  void initState() {
    notifyMe = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Movies',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: const [Text('Notify me on updates')],
              ),
              MySwitch(
                state: notifyMe,
                onChange: (val) {
                  notifyMe = val;
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  final bool state;
  final Function(bool value) onChange;

  const MySwitch({Key? key, required this.state, required this.onChange})
      : super(key: key);
  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _state = false;
  @override
  void initState() {
    _state = widget.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
        inactiveTrackColor: primaryGrey,
        activeColor: primaryOrange,
        value: _state,
        onChanged: (val) {
          _state = val;
          setState(() {
            widget.onChange(val);
          });
        });
  }
}
