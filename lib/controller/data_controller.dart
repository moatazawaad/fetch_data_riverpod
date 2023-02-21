
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/data_model.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromAPI>((ref) => GetDataFromAPI());

class GetDataFromAPI extends ChangeNotifier {
  List<DataModel> listDataModel =[];

  GetDataFromAPI() {
    getData();
}
  Future getData() async {
    listDataModel = [];
    try {
      http.Response response =
      await http.get(Uri.parse("http://jsonplaceholder.typicode.com/posts"));

      // print(response.body);

      var data = jsonDecode(response.body);
      for (int i = 0; i<response.body.length; i++) {
        listDataModel.add(DataModel.fromMap(data[i]));
      }
    }catch (e) {
      print(e.toString());
    }
    print(listDataModel.length);
    notifyListeners();
    // print(data[i]['title']);
  }
}
