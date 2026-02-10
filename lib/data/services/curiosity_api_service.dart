import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/curiosity_model.dart';

class CuriosityApiService {
  Future<List<CuriosityModel>> fetchCuriosities() async {
    final response = await http.get(
      Uri.parse('https://www.freepublicapis.com/api/apis'),
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List list;
      if (decoded is List) {
        list = decoded;
      } else if (decoded is Map<String, dynamic> && decoded['data'] is List) {
        list = decoded['data'] as List;
      } else {
        throw Exception('Formato JSON inesperado desde la API');
      }

      return list.map((e) => CuriosityModel.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar curiosities');
    }
  }
}
