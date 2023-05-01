import 'package:flutter/cupertino.dart';
import 'package:movie_ticket/components/datepicker.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/src/features/reservation/widgets/time.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    String selectedTime = '13:30';

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DatePicker(
            DateTime.now(),
            monthTextStyle: const TextStyle(
                color: primaryWhite, fontWeight: FontWeight.w600),
            dateTextStyle: const TextStyle(
                color: primaryWhite, fontWeight: FontWeight.bold, fontSize: 20),
            dayTextStyle: const TextStyle(
                color: primaryWhite, fontWeight: FontWeight.w600),
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryGold,
            selectionDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: primaryGold,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: [Color.fromARGB(255, 219, 175, 103), primaryGold])),
            selectedTextColor: primaryWhite,
            onDateChange: (date) {
              selectedDate = date;
            },
          ),
          SizedBox(
            height: 70,
            child: Time(
              onTimeChange: (val) {
                selectedTime = val;
              },
            ),
          ),
        ],
      ),
    );
  }
}
