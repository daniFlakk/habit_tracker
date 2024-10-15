import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final int selectedDay;
  final Function(int) onDaySelected;

  CalendarWidget({required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("HOY", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("9 de agosto", style: TextStyle(color: Colors.white60, fontSize: 18)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDay("MAR", 4),
              _buildDay("MIÉ", 5),
              _buildDay("JUE", 6),
              _buildDay("VIE", 7),
              _buildDay("SÁB", 8),
              _buildDay("DOM", 9),
              _buildDay("LUN", 10),
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
          Text(day, style: TextStyle(color: selectedDay == dayNumber ? Colors.white : Colors.white60)),
          SizedBox(height: 5),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: selectedDay == dayNumber ? Colors.blue : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(dayNumber.toString(),
                  style: TextStyle(color: selectedDay == dayNumber ? Colors.white : Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
