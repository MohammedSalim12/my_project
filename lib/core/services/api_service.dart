import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://fastapi-ecommerce-api-production.up.railway.app"; // للـ Emulator

  static Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    return jsonDecode(response.body);
  }

  static Future addUser(String name, String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email}),
    );
    return jsonDecode(response.body);
  }

  static Future deleteUser(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/users/$id"));
    return jsonDecode(response.body);
  }
}
