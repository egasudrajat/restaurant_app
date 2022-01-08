import 'dart:convert';

class Model {
  Model({
    this.restaurants,
  });

  Model.fromJson(dynamic json) {
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants?.add(Restaurants.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'Model{restaurants: $restaurants}';
  }

  List<Restaurants>? restaurants;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (restaurants != null) {
      map['restaurants'] = restaurants?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Restaurants {
  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  Restaurants.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = checkDouble(json['rating']);
    menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
  }

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['pictureId'] = pictureId;
    map['city'] = city;
    map['rating'] = rating;
    if (menus != null) {
      map['menus'] = menus?.toJson();
    }
    return map;
  }

  double checkDouble(dynamic value) {
    if (value is double) {
      return value;
    } else {
      return (value as int).toDouble();
    }
  }
}

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  Menus.fromJson(dynamic json) {
    if (json['foods'] != null) {
      foods = [];
      json['foods'].forEach((v) {
        foods?.add(Foods.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks?.add(Drinks.fromJson(v));
      });
    }
  }

  List<Foods>? foods;
  List<Drinks>? drinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (foods != null) {
      map['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    if (drinks != null) {
      map['drinks'] = drinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Drinks {
  Drinks({
    this.name,
  });

  Drinks.fromJson(dynamic json) {
    name = json['name'];
  }

  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }
}

class Foods {
  Foods({
    this.name,
  });

  Foods.fromJson(dynamic json) {
    name = json['name'];
  }

  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }
}

Model parseRestaurant(String? json) {
  if (json == null) {
    return Model();
  }
  final parsed = jsonDecode(json);
  return Model.fromJson(parsed);
}
// Future _loadSampleJson() async {
//   String jsonString = await rootBundle.loadString("assets/local_restaurant.json");
//   final jsonData = json.decode(jsonString);
//   Model model = Model.fromJson(jsonData);
//   print(model.toString());
// }