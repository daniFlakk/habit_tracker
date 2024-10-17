import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/habit_tracker_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('es_CO', null);
  runApp(const HabitTrackerApp());
}