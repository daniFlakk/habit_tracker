import 'package:flutter/material.dart';

void main() {
  runApp(HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HabitTracker(),
    );
  }
}

class HabitTracker extends StatefulWidget {
  @override
  _HabitTrackerState createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  List<Map<String, dynamic>> habits = [
    {"name": "Madruga", "completed": false, "streak": 0, "color": Colors.green, "icon": Icons.wb_sunny},
    {"name": "Ejercicio", "completed": false, "streak": 0, "progress": "14 / 20 min", "color": Colors.red, "icon": Icons.directions_run},
    {"name": "Beber agua", "completed": false, "streak": 0, "progress": "3 / 8 vasos", "color": Colors.blue, "icon": Icons.local_drink},
    {"name": "Come frutas y verduras", "completed": false, "streak": 0, "color": Colors.orange, "icon": Icons.apple},
  ];

  void toggleHabitCompletion(int index) {
    setState(() {
      habits[index]['completed'] = !habits[index]['completed'];
      if (habits[index]['completed']) {
        habits[index]['streak'] += 1; // Incrementar el contador si se completa el hábito
      } else {
        habits[index]['streak'] = 0;  // Reiniciar el contador si no se completa el hábito
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text("Crea Buenos Hábitos", style: TextStyle(fontSize: 22)),
      ),
      body: Column(
        children: [
          // Sección de fecha y calendario
          Container(
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
                    _buildDay("MAR", "4", false),
                    _buildDay("MIÉ", "5", true),
                    _buildDay("JUE", "6", false),
                    _buildDay("VIE", "7", false),
                    _buildDay("SÁB", "8", false),
                    _buildDay("DOM", "9", false, isToday: true),
                    _buildDay("LUN", "10", false),
                  ],
                ),
              ],
            ),
          ),
          // Sección de tarjetas de hábitos
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return _buildHabitCard(habit, index);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildDay(String day, String date, bool isSelected, {bool isToday = false}) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: isToday ? Colors.white : Colors.white60)),
        SizedBox(height: 5),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : (isToday ? Colors.white : Colors.transparent),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(date, style: TextStyle(color: isSelected ? Colors.white : (isToday ? Colors.black : Colors.white))),
          ),
        ),
      ],
    );
  }

  Widget _buildHabitCard(Map<String, dynamic> habit, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: habit["color"],
      child: ListTile(
        leading: Icon(habit["icon"], color: Colors.white),
        title: Text(habit["name"], style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            habit.containsKey("progress") && habit["progress"] != ""
                ? Text(habit["progress"], style: TextStyle(color: Colors.white70, fontSize: 16))
                : Container(),
            Text("Racha: ${habit['streak']} días", style: TextStyle(color: Colors.white70, fontSize: 16)),
          ],
        ),
        trailing: Checkbox(
          value: habit["completed"],
          onChanged: (value) {
            toggleHabitCompletion(index);
          },
          activeColor: Colors.white,
          checkColor: habit["color"],
        ),
      ),
    );
  }
}
