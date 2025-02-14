import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//DOB Textfiled class
class CalenderTextf extends StatelessWidget {
  const CalenderTextf({
    super.key,
    //create required controller varible
    required this.calenderCont,
  });
//Define controller Widget for reference
  final TextEditingController calenderCont;

  @override
  Widget build(BuildContext context) {
    return TextField(
      //Don't need to type just select from suffic Icon button
      readOnly: true,
      showCursor: false,
      decoration: InputDecoration(
          hintText: 'Date of Birth',
          hintStyle:
              const TextStyle(color: Colors.grey, fontSize: 13),
          border: const UnderlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
              //Use Icon button for user input DOB
          suffixIcon: IconButton(
              onPressed: () async {
                //Define user selected Date variable to formate it on desired pattern
                var selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000, 1, 25),
                    lastDate: DateTime(2026, 1, 25));
                    //if user select any date then here's beginnig of formation selected date into desired pattern
                if (selectedDate != null) {
                  //Use intl.dart pre-built liberary to formaat selected date
                  calenderCont.text =
                      DateFormat('d/M/y').format(selectedDate);
                }
              },
              icon: const Icon(Icons.calendar_month_outlined))),
      controller: calenderCont,
    );
  }
}
