import 'package:flutter/material.dart';

class AddHabitWidget extends StatefulWidget {
  final Function(String, Color, IconData) onAddHabit;

  const AddHabitWidget({super.key, required this.onAddHabit});

  @override
  _AddHabitWidgetState createState() => _AddHabitWidgetState();
}

class _AddHabitWidgetState extends State<AddHabitWidget> {
  final TextEditingController _habitNameController = TextEditingController();
  Color _selectedColor = Colors.green;
  IconData _selectedIcon = Icons.wb_sunny;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Hábito'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _habitNameController,
            decoration: const InputDecoration(labelText: 'Nombre del hábito'),
          ),
          const SizedBox(height: 10),
          // Selector de color
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text("Color"),
          //     DropdownButton<Color>(
          //       value: _selectedColor,
          //       items: [
          //         DropdownMenuItem(
          //           value: Colors.green,
          //           child: Container(width: 24, height: 24, color: Colors.green),
          //         ),
          //         DropdownMenuItem(
          //           value: Colors.red,
          //           child: Container(width: 24, height: 24, color: Colors.red),
          //         ),
          //         DropdownMenuItem(
          //           value: Colors.blue,
          //           child: Container(width: 24, height: 24, color: Colors.blue),
          //         ),
          //         DropdownMenuItem(
          //           value: Colors.orange,
          //           child: Container(width: 24, height: 24, color: Colors.orange),
          //         ),
          //       ],
          //       onChanged: (Color? newColor) {
          //         if (newColor != null) {
          //           setState(() {
          //             _selectedColor = newColor;
          //           });
          //         }
          //       },
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          // Selector de ícono
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Icono"),
              DropdownButton<IconData>(
                value: _selectedIcon,
                items: const [
                  DropdownMenuItem(
                    value: Icons.wb_sunny,
                    child: Icon(Icons.wb_sunny),
                  ),
                  DropdownMenuItem(
                    value: Icons.directions_run,
                    child: Icon(Icons.directions_run),
                  ),
                  DropdownMenuItem(
                    value: Icons.local_drink,
                    child: Icon(Icons.local_drink),
                  ),
                  DropdownMenuItem(
                    value: Icons.apple,
                    child: Icon(Icons.apple),
                  ),
                  DropdownMenuItem(
                    value: Icons.album,
                    child: Icon(Icons.album),
                  ),
                  DropdownMenuItem(
                    value: Icons.book,
                    child: Icon(Icons.book),
                  ),
                ],
                onChanged: (IconData? newIcon) {
                  if (newIcon != null) {
                    setState(() {
                      _selectedIcon = newIcon;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_habitNameController.text.isNotEmpty) {
              widget.onAddHabit(_habitNameController.text, _selectedColor, _selectedIcon);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
