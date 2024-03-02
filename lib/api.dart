import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HealthApi.dart';

class ApiManager {
  final String apiUrl;

  ApiManager({required this.apiUrl});

  Future<List<Resource>> fetchHealthResources() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final HealthApi healthApi = HealthApi.fromJson(jsonData);

      // Assuming Resources is a list of Resource objects
      return healthApi.result?.resources?.resource ?? [];
    } else {
      throw Exception('Failed to load health resources');
    }
  }
}

