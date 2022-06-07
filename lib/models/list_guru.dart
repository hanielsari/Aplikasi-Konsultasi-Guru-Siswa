import 'dart:convert';

RestaurantResult restaurantListFromJson(String str) =>
    RestaurantResult.fromJson(json.decode(str));

String restaurantListToJson(RestaurantResult data) =>
    json.encode(data.toJson());

class RestaurantResult {
  RestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id; //as id teacher
  String name; // as nama teacher
  String description; // as description
  String pictureId; // as image
  String city; // as matapelajaran
  double rating; // as rate

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: double.parse(json["rating"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}

class Menus {
  List<Food> foods;

  List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> article) => Menus(
    foods: List<Food>.from(article["foods"].map((x) => Food.fromJson(x))),
    drinks:
    List<Drink>.from(article["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Drink {
  String name;

  Drink({
    required this.name,
  });

  factory Drink.fromJson(Map<String, dynamic> restaurant) => Drink(
    name: restaurant["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Food {
  String name;

  Food({
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> restaurant) => Food(
    name: restaurant["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

// class Menus {
//   List<Food> foods;
//
//   List<Drink> drinks;
//
//   Menus({
//     required this.foods,
//     required this.drinks,
//   });
//
//   factory Menus.fromJson(Map<String, dynamic> article) => Menus(
//     foods: List<Food>.from(article["foods"].map((x) => Food.fromJson(x))),
//     drinks:
//     List<Drink>.from(article["drinks"].map((x) => Drink.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
//     "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
//   };
// }

// class Drink {
//   String name;
//
//   Drink({
//     required this.name,
//   });
//
//   factory Drink.fromJson(Map<String, dynamic> restaurant) => Drink(
//     name: restaurant["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//   };
// }

// class Food {
//   String name;
//
//   Food({
//     required this.name,
//   });
//
//   factory Food.fromJson(Map<String, dynamic> restaurant) => Food(
//     name: restaurant["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//   };
// }
