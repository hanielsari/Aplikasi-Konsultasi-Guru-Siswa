import 'package:flutter/foundation.dart';
import 'package:capstone_project/api/api_service_percobaan.dart';
import 'package:capstone_project/models/list_guru_apibaru.dart';

enum StateResultList { Loading, NoData, HasData, Error }

class ListTeachersProvider extends ChangeNotifier {
  final ApiService service_api;

  ListTeachersProvider({required this.service_api}) {
    fetchAllRestaurantList();
  }

  ListGuru? _resultRestaurantsSearch;
  String _message = '';
  StateResultList? _state;

  String get message => _message;
  ListGuru? get result => _resultRestaurantsSearch;
  StateResultList? get state => _state;

  Future<dynamic> fetchAllRestaurantList() async {
    try {
      _state = StateResultList.Loading;

      final teacher = await service_api.getList();
      if (teacher.teachers.isEmpty) {
        _state = StateResultList.NoData;
        notifyListeners();
        return _message = 'Data Tidak Ditemukan :(';
      } else {
        _state = StateResultList.HasData;

        notifyListeners();
        return _resultRestaurantsSearch = teacher;
      }
    } catch (error) {
      _state = StateResultList.Error;
      notifyListeners();
      return _message = 'Kamu tidak tersambung dengan internet';
    }
  }
}