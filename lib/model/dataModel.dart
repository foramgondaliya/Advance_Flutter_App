import 'package:flutter/cupertino.dart';

class allDataModel {
  final String image;

  allDataModel({required this.image});

  factory allDataModel.fromMap({required Map data}) {
    return allDataModel(image: data['image']);
  }
}
