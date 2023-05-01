import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_ticket/consts/data.dart';

import '../consts/colors.dart';

class Tickets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Tickets',
          style: TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        centerTitle: true,
        backgroundColor: primaryBlack,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: primaryBlack,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: tickets.length,
            separatorBuilder: (_, i) => const SizedBox(height: 20),
            itemBuilder: (_, i) {
              final ticket = tickets[i];
              // final total = booking.bookings.fold(0.0, (sum, seat) => seat.price);
              // final noOfSeats = booking.bookings.length;
              return SizedBox(
                height: 140,
                child: GestureDetector(
                  // onTap: () => onTap(context,booking),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      //Booking overview
                      TicketSummaryRow(
                        total: ticket['price'],
                        noOfSeats: ticket['seats'].length,
                        title: ticket['title'],
                        showDateTime: ticket['date'],
                        // showType: booking.show.showType,
                      ),

                      //Movie Image
                      Positioned(
                        bottom: 13,
                        left: 13,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            ticket['img'],
                            fit: BoxFit.fitHeight,
                            width: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}

class TicketSummaryRow extends StatelessWidget {
  final String title;
  final int noOfSeats;
  final double total;
  final DateTime showDateTime;

  const TicketSummaryRow({
    Key? key,
    required this.total,
    required this.title,
    required this.noOfSeats,
    required this.showDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Ticket total and movie name
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 57, 61, 72),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(125, 10, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Movie data
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: primaryWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  //Show type row
                  Row(
                    children: const [
                      //Show type icon
                      Icon(
                        Icons.hd_outlined,
                        size: 19,
                        color: Colors.blue,
                      ),

                      SizedBox(width: 10),

                      //Show status
                      Text(
                        '3D',
                        style: TextStyle(
                          fontSize: 14,
                          color: primaryWhite,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  //Show timings row
                  Row(
                    children: [
                      //Show date icon
                      const Icon(
                        Icons.date_range_outlined,
                        size: 19,
                        color: primaryWhite,
                      ),

                      const SizedBox(width: 10),

                      //Show time data
                      Text(
                        DateFormat('dd MMM yyyy HH:mm').format(showDateTime),
                        style: const TextStyle(
                          fontSize: 14,
                          color: primaryWhite,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  //Show payment row
                  Row(
                    children: [
                      //Total icon
                      const Icon(
                        Icons.local_atm_outlined,
                        size: 19,
                        color: Colors.green,
                      ),

                      const SizedBox(width: 10),

                      //Total data
                      Text(
                        'Rp $total',
                        style: const TextStyle(
                          fontSize: 14,
                          color: primaryWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //No of seats
          SizedBox(
            height: double.infinity,
            width: 45,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                // gradient: primaryGold,
                color: primaryGold,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Ticket icon
                  const Icon(
                    Icons.local_activity_sharp,
                    color: primaryWhite,
                  ),

                  const SizedBox(height: 5),

                  //No. of seats
                  Text(
                    '$noOfSeats',
                    style: const TextStyle(
                      fontSize: 16,
                      color: primaryWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}