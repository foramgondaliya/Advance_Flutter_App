import 'dart:convert';

import 'package:adv_exam/model/dataModel.dart';
import 'package:http/http.dart' as http;

class APIhelpers {
  APIhelpers._();

  static APIhelpers apihelpers = APIhelpers._();

  Future<List<allDataModel>?> fetchData() async {
    http.Response response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);

      List allData = decodedData;
      List<allDataModel> data =
          allData.map((e) => allDataModel.fromMap(data: e)).toList();
      return data;
    }
  }
}
