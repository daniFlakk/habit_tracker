import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatelessWidget {
  final int selectedDay;
  final Function(int) onDaySelected;
  DateTime today = DateTime.now();
  String formattedDate =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  CalendarWidget(
      {super.key, required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("HOY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(formattedDate,
              style: TextStyle(color: Colors.white60, fontSize: 18)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDay("LUN", today.day - 1),
              _buildDay("MAR", today.day),
              _buildDay("MIE", today.day + 1),
              _buildDay("JUE", today.day + 2),
              _buildDay("VIE", today.day + 3),
              _buildDay("SAB", today.day + 4),
              _buildDay("DOM", today.day + 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDay(String day, int dayNumber) {
    return GestureDetector(
      onTap: () => onDaySelected(dayNumber),
      child: Column(
        children: [
          Text(day,
              style: TextStyle(
                  color: selectedDay == dayNumber
                      ? Colors.white
                      : Colors.white60)),
          const SizedBox(height: 5),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color:
                  selectedDay == dayNumber ? Colors.blue : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(dayNumber.toString(),
                  style: TextStyle(
                      color: selectedDay == dayNumber
                          ? Colors.white
                          : Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
