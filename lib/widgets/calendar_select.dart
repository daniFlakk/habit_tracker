import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  final int selectedDay;
  final Function(int) onDaySelected;

  const CalendarWidget(
      {super.key, required this.selectedDay, required this.onDaySelected});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late PageController _pageController;
  late DateTime _currentWeek;
  final DateTime today =
      DateTime.now().toUtc().subtract(const Duration(hours: 5));

  @override
  void initState() {
    super.initState();
    _currentWeek = today;
    _pageController = PageController(initialPage: 50);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<DateTime> _getWeekDays(DateTime week) {
    int currentDayOfWeek = week.weekday;
    DateTime sunday = week.subtract(Duration(days: currentDayOfWeek % 7));
    return List.generate(7, (index) => sunday.add(Duration(days: index)));
  }

  Widget _buildDay(String day, int dayNumber) {
    return GestureDetector(
      onTap: () => widget.onDaySelected(dayNumber),
      child: Column(
        children: [
          Text(day,
              style: TextStyle(
                  color: widget.selectedDay == dayNumber
                      ? Colors.white
                      : Colors.white60)),
          const SizedBox(height: 5),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: widget.selectedDay == dayNumber
                  ? Colors.blue
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                dayNumber.toString(),
                style: TextStyle(
                    color: widget.selectedDay == dayNumber
                        ? Colors.white
                        : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekCalendar(DateTime week) {
    List<DateTime> weekDays = _getWeekDays(week);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekDays.map((date) {
        String dayName = DateFormat('EEE', 'es_CO').format(date).toUpperCase();
        return _buildDay(dayName, date.day);
      }).toList(),
    );
  }

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
          Text(DateFormat('yyyy-MM-dd HH:mm:ss', 'es_CO').format(today),
              style: const TextStyle(color: Colors.white60, fontSize: 18)),
          const SizedBox(height: 20),
          SizedBox(
            height: 70, // Altura fija para el PageView
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  // Calculamos la nueva semana basada en la página actual
                  _currentWeek = today.add(Duration(days: (page - 50) * 7));
                });
              },
              itemBuilder: (context, page) {
                // Calculamos la fecha para esta página
                DateTime weekForPage =
                    today.add(Duration(days: (page - 50) * 7));
                return _buildWeekCalendar(weekForPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
