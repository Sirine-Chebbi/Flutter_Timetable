import 'dart:convert';
import 'package:flutter/services.dart';

class JsonService {
  static Future<Map<String, dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/timetable.json');
    return json.decode(jsonString);
  }

  static Future<void> saveJson(Map<String, dynamic> data) async {
    // Écriture dans le fichier JSON (nécessite un plugin comme `path_provider`).
    // Pour le moment, simulez cela pour des tests en mémoire.
  }
}
