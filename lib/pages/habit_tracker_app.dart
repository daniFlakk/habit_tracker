import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/calendar_select.dart';
import 'package:habit_tracker/widgets/habit_list.dart';

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  List<Map<String, dynamic>> habits = [
    {
      "name": "Madruga",
      "completed": false,
      "streak": 0,
      "color": Colors.green,
      "icon": Icons.wb_sunny
    },
    {
      "name": "Ejercicio",
      "completed": false,
      "streak": 0,
      "progress": "14 / 20 min",
      "color": Colors.red,
      "icon": Icons.directions_run
    },
    {
      "name": "Beber agua",
      "completed": false,
      "streak": 0,
      "progress": "3 / 8 vasos",
      "color": Colors.blue,
      "icon": Icons.local_drink
    },
    {
      "name": "Come frutas y verduras",
      "completed": false,
      "streak": 0,
      "color": Colors.orange,
      "icon": Icons.apple
    },
  ];
  // Mapa para guardar el estado de los hábitos por día
  // Map<int, List<Map<String, dynamic>>> habitsByDay = {
  //   15: [
  //     {
  //       "name": "Madruga",
  //       "completed": false,
  //       "streak": 0,
  //       "color": Colors.green,
  //       "icon": Icons.wb_sunny
  //     },
  //     {
  //       "name": "Ejercicio",
  //       "completed": false,
  //       "streak": 0,
  //       "progress": "14 / 20 min",
  //       "color": Colors.red,
  //       "icon": Icons.directions_run
  //     },
  //     {
  //       "name": "Beber agua",
  //       "completed": false,
  //       "streak": 0,
  //       "progress": "3 / 8 vasos",
  //       "color": Colors.blue,
  //       "icon": Icons.local_drink
  //     },
  //     {
  //       "name": "Come frutas y verduras",
  //       "completed": false,
  //       "streak": 0,
  //       "color": Colors.orange,
  //       "icon": Icons.apple
  //     },
  //   ],
  //   16: [
  //     {
  //       "name": "Madruga",
  //       "completed": true,
  //       "streak": 1,
  //       "color": Colors.green,
  //       "icon": Icons.wb_sunny
  //     },
  //     {
  //       "name": "Ejercicio",
  //       "completed": false,
  //       "streak": 0,
  //       "progress": "14 / 20 min",
  //       "color": Colors.red,
  //       "icon": Icons.directions_run
  //     },
  //     {
  //       "name": "Beber agua",
  //       "completed": true,
  //       "streak": 1,
  //       "progress": "3 / 8 vasos",
  //       "color": Colors.blue,
  //       "icon": Icons.local_drink
  //     },
  //     {
  //       "name": "Come frutas y verduras",
  //       "completed": false,
  //       "streak": 0,
  //       "color": Colors.orange,
  //       "icon": Icons.apple
  //     },
  //   ],
  //   17: [
  //     {
  //       "name": "Madruga",
  //       "completed": true,
  //       "streak": 1,
  //       "color": Colors.green,
  //       "icon": Icons.wb_sunny
  //     },
  //     {
  //       "name": "Ejercicio",
  //       "completed": false,
  //       "streak": 0,
  //       "progress": "14 / 20 min",
  //       "color": Colors.red,
  //       "icon": Icons.directions_run
  //     },
  //     {
  //       "name": "Beber agua",
  //       "completed": true,
  //       "streak": 1,
  //       "progress": "3 / 8 vasos",
  //       "color": Colors.blue,
  //       "icon": Icons.local_drink
  //     },
  //     {
  //       "name": "Come frutas y verduras",
  //       "completed": false,
  //       "streak": 0,
  //       "color": Colors.orange,
  //       "icon": Icons.apple
  //     },
  //   ],
  //   18: [
  //     {
  //       "name": "Madruga",
  //       "completed": true,
  //       "streak": 1,
  //       "color": Colors.green,
  //       "icon": Icons.wb_sunny
  //     },
  //     {
  //       "name": "Ejercicio",
  //       "completed": false,
  //       "streak": 0,
  //       "progress": "14 / 20 min",
  //       "color": Colors.red,
  //       "icon": Icons.directions_run
  //     },
  //     {
  //       "name": "Beber agua",
  //       "completed": true,
  //       "streak": 1,
  //       "progress": "3 / 8 vasos",
  //       "color": Colors.blue,
  //       "icon": Icons.local_drink
  //     },
  //     {
  //       "name": "Come frutas y verduras",
  //       "completed": false,
  //       "streak": 0,
  //       "color": Colors.orange,
  //       "icon": Icons.apple
  //     },
  //   ],
  //   19: [
  //     {
  //       "name": "Madruga",
  //       "completed": true,
  //       "streak": 1,
  //       "color": Colors.green,
  //       "icon": Icons.wb_sunny
  //     },
  //     {
  //       "name": "Ejercicio",
  //       "completed": false,
  //       "streak": 0,
  //       "progress": "14 / 20 min",
  //       "color": Colors.red,
  //       "icon": Icons.directions_run
  //     },
  //     {
  //       "name": "Beber agua",
  //       "completed": true,
  //       "streak": 1,
  //       "progress": "3 / 8 vasos",
  //       "color": Colors.blue,
  //       "icon": Icons.local_drink
  //     },
  //     {
  //       "name": "Come frutas y verduras",
  //       "completed": false,
  //       "streak": 0,
  //       "color": Colors.orange,
  //       "icon": Icons.apple
  //     },
  //   ],
  // };

  // Cambia el día seleccionado
  void changeSelectedDay(int day) {
    setState(() {
      selectedDay = day;
    });
  }

  // Alterna la finalización de un hábito y actualiza la racha
  void toggleHabitCompletion(int index) {
    //List<Map<String, dynamic>>? habits = habits ?? [];
    if (habits.isNotEmpty) {
      setState(() {
        habits[index]['completed'] = !habits[index]['completed'];
        if (habits[index]['completed']) {
          habits[index]['streak'] += 1;
        } else {
          habits[index]['streak'] = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title:
            const Text("Crea Buenos Hábitos", style: TextStyle(fontSize: 22)),
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
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
