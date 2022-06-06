import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/api_service.dart';
import '../models/detail_guru.dart';
import '../providers/detail_guru.dart';
import '../widgets/detail_card.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';
  final String idDetail;

  const RestaurantDetailPage({Key? key, required this.idDetail})
      : super(key: key);

  Widget _buildDetail() {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) =>
          DetailRestaurantProvider(service_api: ApiService(), id: idDetail),
      child: Consumer<DetailRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == DetailResultState.Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == DetailResultState.HasData) {
            final restaurants = state.detailRestaurant.restaurant;
            return DetailRestaurant(
              restaurant: restaurants,
            );
          } else if (state.state == DetailResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == DetailResultState.Error) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDetail();
  }
}