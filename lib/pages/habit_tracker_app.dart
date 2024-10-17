import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/add_habit_widget.dart';
import 'package:habit_tracker/widgets/calendar_select.dart';
import 'package:habit_tracker/widgets/habit_list.dart';
import 'congratulations_dialog.dart'; // Importa el nuevo archivo

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HabitTracker(),
    );
  }
}

// Vista principal que maneja el estado de los hábitos
class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  _HabitTrackerState createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  int selectedDay = DateTime.now().day; // Día seleccionado
  final int today = DateTime.now().day; // Día actual

  List<Map<String, dynamic>> habits = [
    {
      "name": "Madruga",
      "completed": false,
      "streak": 0,
      "goal": 21,
      "color": Colors.green,
      "icon": Icons.wb_sunny
    },
    {
      "name": "Ejercicio",
      "completed": false,
      "streak": 0,
      "goal": 21,
      "progress": "14 / 20 min",
      "color": Colors.red,
      "icon": Icons.directions_run
    },
    {
      "name": "Beber agua",
      "completed": false,
      "streak": 0,
      "goal": 21,
      "progress": "3 / 8 vasos",
      "color": Colors.blue,
      "icon": Icons.local_drink
    },
    {
      "name": "Come frutas y verduras",
      "completed": false,
      "streak": 0,
      "goal": 21,
      "color": Colors.orange,
      "icon": Icons.apple
    },
  ];

  Map<int, List<bool>> completionStatus = {};

  // Cambia el día seleccionado
  void changeSelectedDay(int day) {
    setState(() {
      selectedDay = day;

      for (int i = 0; i < habits.length; i++) {
        if (habits[i]["completed"] == false) {
          habits[i]["streak"] = 0;
        }

        habits[i]["completed"] = false;
      }
    });
  }

 void toggleHabitCompletion(int index) {
  if (habits.isNotEmpty) {
    setState(() {
      habits[index]['completed'] = !habits[index]['completed'];
      if (habits[index]['completed']) {
        habits[index]['streak'] += 1;
      } else {
        habits[index]['streak'] = 0;
      }

      if (habits[index]['streak'] == 21) {
        _showCongratulationsDialog(habits[index]['name']);
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            habits.removeAt(index);
          });
        });
      }
    });
  }
}


  // Método para mostrar el diálogo de felicitaciones
  void _showCongratulationsDialog(String habitName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CongratulationsDialog(habitName: habitName); // Llama a la nueva clase
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text("Crea Buenos Hábitos", style: TextStyle(fontSize: 22)),
      ),
      body: Column(
        children: [
          // Widget de calendario
          CalendarWidget(
            selectedDay: selectedDay,
            onDaySelected: changeSelectedDay,
          ),
          // Sección de tarjetas de hábitos
          Expanded(
            child: HabitList(
              habits: habits,
              toggleCompletion: toggleHabitCompletion,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddHabitWidget(
                onAddHabit: (String habitName, Color color, IconData icon) {
                  setState(() {
                    habits.add({
                      "name": habitName,
                      "completed": false,
                      "streak": 0,
                      "goal": 21, // Meta por defecto
                      "color": color,
                      "icon": icon
                    });
                  });
                },
              );
            },
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
