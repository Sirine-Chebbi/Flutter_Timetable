import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  //static const String baseUrl = 'http://192.168.83.232:3000';
  static const String baseUrl = 'http://10.0.2.2:3000';


  // Fetch all rooms
  static Future<List<dynamic>> fetchRooms() async {
    final response = await http.get(Uri.parse('$baseUrl/rooms'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  
}
