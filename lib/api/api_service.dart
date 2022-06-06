import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:capstone_project/models/detail_guru.dart';
import 'package:capstone_project/models/list_guru.dart';
import 'package:capstone_project/models/search_guru.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String _restaurantlist = 'list';
  static final String _restaurantdetail = 'detail/';

  Future<RestaurantResult> getList() async {
    final response = await http.get(Uri.parse(_baseUrl + _restaurantlist));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    final response =
    await http.get(Uri.parse(_baseUrl + _restaurantdetail + id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load restaurant detail");
    }
  }

  Future<SearchRestaurantResult> searchingRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + "search?q=" + query));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant searching');
    }
  }
}