import 'package:flutter/material.dart';

class CongratulationsDialog extends StatelessWidget {
  final String habitName;

  const CongratulationsDialog({Key? key, required this.habitName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Fondo transparente para el difuminado
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // Cambia la posición de la sombra
            ),
          ],
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta la altura
          children: [
            Text(
              '¡Felicidades!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[700],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Has logrado cumplir tu hábito:',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              habitName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: habitName == "Madruga" ? Colors.red : Colors.black, // Cambia el color según el hábito
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Hecho'),
            ),
          ],
        ),
      ),
    );
  }
}
