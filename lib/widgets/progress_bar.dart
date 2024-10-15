import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final Map<String, dynamic> habit;
  final int index;
  final Function(int) toggleCompletion;

  const HabitCard(
      {super.key,
      required this.habit,
      required this.index,
      required this.toggleCompletion});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: habit["color"],
      child: ListTile(
        leading: Icon(habit["icon"], color: Colors.white),
        title: Text(habit["name"],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            habit.containsKey("progress") && habit["progress"] != ""
                ? Text(habit["progress"],
                    style: const TextStyle(color: Colors.white70, fontSize: 16))
                : Container(),
            Text("Racha: ${habit['streak']} días",
                style: const TextStyle(color: Colors.white70, fontSize: 16)),
          ],
        ),
        trailing: Checkbox(
          value: habit["completed"],
          onChanged: (value) {
            toggleCompletion(index);
          },
          activeColor: Colors.white,
          checkColor: habit["color"],
        ),
      ),
    );
  }
}
