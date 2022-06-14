import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:capstone_project/models/list_guru_apibaru.dart';

class ApiService {
  static final String _baseUrl = 'http://192.168.1.8:5000/';
  static final String _teacherlist = 'teachers';

  // static final String _restaurantdetail = 'detail/';

  Future<ListGuru> getList() async {
    final response = await http.get(Uri.parse(_baseUrl + _teacherlist));
    if (response.statusCode == 200) {
      return ListGuru.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }
}
