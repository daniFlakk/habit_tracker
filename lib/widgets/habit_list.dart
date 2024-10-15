import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/progress_bar.dart';

class HabitList extends StatelessWidget {
  final List<Map<String, dynamic>> habits;
  final Function(int) toggleCompletion;

  HabitList({required this.habits, required this.toggleCompletion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return HabitCard(
            habit: habit,
            index: index,
            toggleCompletion: toggleCompletion,
          );
        },
      ),
    );
  }
}
