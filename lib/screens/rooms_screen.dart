import 'package:flutter/material.dart';
import 'package:timetable_management/services/api_service.dart';

class RoomsScreen extends StatefulWidget {
  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late Future<List<dynamic>> rooms;

  @override
  void initState() {
    super.initState();
    rooms = ApiService.fetchRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rooms')),
      body: FutureBuilder<List<dynamic>>(
        future: rooms,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Données chargées avec succès
            final roomData = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Pour permettre le défilement horizontal si nécessaire
              child: DataTable(
                columns: [
                  DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Room Name', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Building', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Capacity', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Other Attribute', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: roomData.map((room) {
                  return DataRow(cells: [
                    DataCell(Text(room['id'].toString())), // Affiche l'ID
                    DataCell(Text(room['room_name'] ?? 'N/A')), // Affiche le nom de la salle
                    DataCell(Text(room['building'] ?? 'N/A')), // Affiche le bâtiment
                    DataCell(Text(room['capacity']?.toString() ?? 'Unknown')), // Capacité de la salle
                    DataCell(Text(room['other_attribute'] ?? 'Not Provided')), // Un autre attribut (modifiable)
                  ]);
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
