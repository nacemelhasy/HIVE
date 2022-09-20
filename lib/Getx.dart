import 'dart:convert';

import 'package:api/Hive.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Model {
  List data = [];
  Model({required this.data});
  factory Model.fromJson(List json) {
    List fData = [];
    json.forEach((element) {
      element = Data.fromJson(element);
      fData.add(element);
    });
    return Model(data: fData);
  }
}

class Data {
  String? created;
  int? id;
  String? content;
  String? title;

  Data.fromJson(Map json) {
    id = json['id'];
    content = json['content'];
    title = json['title'];
    created = json['created'];
  }
}

class init extends GetxController {
  Model? data;
  bool loadData = false;

  @override
  void onInit() async {
    //  await fetch();
    // loadData = !loadData;

    update();
    super.onInit();
  }

  fetch() async {
    final response =
        await http.get(Uri.parse('http://alawami.pythonanywhere.com/data/'));
    if (response.statusCode == 200) {
      print('doneeeeeeeeeee');
      data = Model.fromJson(jsonDecode(response.body));
    } else {
      print('reooo');
    }
  }
}
