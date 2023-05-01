import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_ticket/components/curved_screen.dart';
import 'package:movie_ticket/components/seat.dart';
import 'package:movie_ticket/src/common_widgets/back_button_icon.dart';
import 'package:movie_ticket/src/features/reservation/widgets/date_time_picker.dart';

import '../../../../components/datepicker.dart';
import '../widgets/time.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/data.dart';

class Reservation extends StatelessWidget {
  final GlobalKey<RowSeatState> _key = GlobalKey();
  final GlobalKey<_Price> _priceKey = GlobalKey();
  final Map<String, dynamic> movie;
  final int index;
  Reservation({Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    String selectedTime = '13:30';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        elevation: 0,
        leading: BackIconButton(
          targetContext: context,
        ),
        title: Text(movie['title'],
            style: const TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Text('Session selection',
                style: TextStyle(color: primaryGrey, fontSize: 14))),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: primaryBlack,
          ),
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[DateTimePicker()],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text('Choose Seats',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurvedScreen(screenWidth: MediaQuery.of(context).size.width),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  Text('SCREEN', style: TextStyle(color: primaryGrey))
                ],
              ),
              RowSeat(
                index: index,
                key: _key,
                emitChanges: (val) {
                  _priceKey.currentState!.setQty(val);
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ]))
          ])),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: primaryBlack),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Price(qty: 0, key: _priceKey),
            ElevatedButton(
              onPressed: () {
                List<String> selectedSeats =
                    _key.currentState!.getSelectedSeats();
                if (selectedSeats.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No seats selected!'),
                      duration: Duration(seconds: 2)));
                } else {
                  for (var element in selectedSeats) {
                    int r = row.indexOf(element[0]);
                    int c = int.parse(element.substring(1, element.length)) - 1;
                    seat[index][r][c] = -1;
                  }
                  final String dateTimeString =
                      DateFormat('yyyy-MM-dd').format(selectedDate) +
                          " " +
                          selectedTime;
                  // log(dateTimeString);
                  // final DateTime t = DateFormat("yyyy-MM-dd hh:mm").parse(dateTimeString);
                  // inspect(DateFormat('dd MMM yyyy HH:mm').format(t));
                  Map<String, dynamic> data = {
                    'title': movie['title'],
                    'img': movie['img'],
                    'date':
                        DateFormat("yyyy-MM-dd hh:mm").parse(dateTimeString),
                    'seats': selectedSeats,
                    'price': 55000.0 * selectedSeats.length
                  };
                  tickets.add(data);
                  Navigator.of(context).popUntil(ModalRoute.withName("/"));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Ticket bought!'),
                      duration: Duration(seconds: 2)));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(primaryGold),
              ),
              child: const Text(
                'Buy Ticket',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Price extends StatefulWidget {
  final int qty;
  const Price({Key? key, required this.qty}) : super(key: key);
  @override
  State<Price> createState() => _Price();
}

class _Price extends State<Price> {
  int _qty = 0;
  @override
  void initState() {
    _qty = widget.qty;
    super.initState();
  }

  void setQty(int x) {
    _qty = x;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Price: Rp ${_qty * 55000.0}',
      style: const TextStyle(fontWeight: FontWeight.w600),
    );
  }
}
