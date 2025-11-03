import '../../domain/entity/coffee.dart';

class CoffeeModel extends Coffee {
  CoffeeModel({
    required super.name,
    required super.description,
    required super.price,
    required super.sugarLevel,
    required super.imageUrl,
    required super.available,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      sugarLevel: json['sugarLevel'],
      imageUrl: json['imageUrl'],
      available: json['available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'sugarLevel': sugarLevel,
      'imageUrl': imageUrl,
      'available': available,
    };
  }
}
