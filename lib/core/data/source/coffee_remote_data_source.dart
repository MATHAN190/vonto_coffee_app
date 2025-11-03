import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/coffee_model.dart';
import '../../constant/api_constants.dart';

class CoffeeRemoteDataSource {

  Future<List<CoffeeModel>> getCoffees() async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => CoffeeModel.fromJson(e)).toList();
    } else {
      throw Exception("Faild to fetch coffees");
    }
  }
}
