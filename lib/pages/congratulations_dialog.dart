// congratulations_dialog.dart

import 'package:flutter/material.dart';

class CongratulationsDialog extends StatelessWidget {
  final String habitName;

  const CongratulationsDialog({Key? key, required this.habitName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withOpacity(0.9),
      title: const Text("¡Felicidades!"),
      content: Text("Has logrado cumplir el hábito '$habitName' por 21 días."),
      actions: [
        TextButton(
          child: const Text("Volver"),
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
        ),
      ],
    );
  }
}
