import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:capstone_project/api/api_service.dart';
import 'package:capstone_project/models/detail_guru.dart';


enum DetailResultState { Loading, Error, NoData, HasData }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  late RestaurantDetail _detailRestaurant;
  late DetailResultState _state;
  String _message = '';

  DetailRestaurantProvider({required this.id, required this.apiService}) {
    _getDetailRestaurant(id);
  }

  String get message => _message;
  RestaurantDetail get detailRestaurant => _detailRestaurant;
  DetailResultState get state => _state;

  Future<dynamic> _getDetailRestaurant(String id) async {
    try {
      _state = DetailResultState.Loading;
      notifyListeners();
      final detailRestaurant = await apiService.getRestaurantDetail(id);
      if (detailRestaurant.error) {
        _state = DetailResultState.NoData;
        notifyListeners();
      } else {
        _state = DetailResultState.HasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
      }
    } on SocketException {
      _state = DetailResultState.Error;
      notifyListeners();
      return _message =
      "tidak bisa terhubung, silahkan cek koneksi anda";
    } catch (e) {
      _state = DetailResultState.Error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
