import 'package:flutter/material.dart';

class HabitProgressBar extends StatelessWidget {
  final String habitName; // Nombre del hábito (por ejemplo: "Ejercicio")
  final int currentValue; // Valor actual (por ejemplo: 14 minutos)
  final int goalValue; // Valor meta (por ejemplo: 20 minutos)

  const HabitProgressBar({
    super.key,
    required this.habitName,
    required this.currentValue,
    required this.goalValue,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentValue / goalValue;

    // Calcular el color interpolado según el progreso
    Color interpolatedColor = Color.lerp(Colors.red, Colors.green, progress)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del hábito
          Text(
            habitName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Contenedor de la barra de progreso
          Stack(
            children: [
              // Fondo de la barra (gris claro)
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Barra de progreso (en color)
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width * progress,
                decoration: BoxDecoration(
                  color: interpolatedColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          // Texto con el progreso actual (por ejemplo: "14 / 20 min")
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              '$currentValue / $goalValue',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Ejemplo de uso del widget HabitProgressBar:
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Habit Progress'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            HabitProgressBar(
              habitName: 'Ejercicio',
              currentValue: 14,
              goalValue: 20,
            ),
            HabitProgressBar(
              habitName: 'Beber agua',
              currentValue: 3,
              goalValue: 8,
            ),
            HabitProgressBar(
              habitName: 'Come frutas y verduras',
              currentValue: 2,
              goalValue: 5,
            ),
          ],
        ),
      ),
    ),
  ));
}
