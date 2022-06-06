import 'package:flutter/foundation.dart';
import 'package:capstone_project/api/api_service.dart';
import 'package:capstone_project/models/detail_guru.dart';


enum DetailResultState { Loading, Error, NoData, HasData }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService service_api;
  final String id;

  late RestaurantDetail _detailRestaurant;
  late DetailResultState _state;
  String _message = '';

  DetailRestaurantProvider({required this.id, required this.service_api}) {
    _getDetailRestaurant(id);
  }

  String get message => _message;
  RestaurantDetail get detailRestaurant => _detailRestaurant;
  DetailResultState get state => _state;

  Future<dynamic> _getDetailRestaurant(String id) async {
    try {
      _state = DetailResultState.Loading;
      notifyListeners();
      final detailRestaurant = await service_api.getRestaurantDetail(id);
      if (detailRestaurant.error) {
        _state = DetailResultState.NoData;
        notifyListeners();
      } else {
        _state = DetailResultState.HasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
      }
    } catch (e) {
      _state = DetailResultState.Error;
      notifyListeners();
      return _message = 'Kamu tidak tersambung dengan internet';
    }
  }
}
