import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/request_model.dart';

class RequestRepository {
  late List<Request> _requests;

  List<Request> get requests => _requests;

  Future<bool> init() async {
    _requests = await loadRequests();
    return true;
  }

  static Future<List<Request>> loadRequests() async {
    final prefs = await SharedPreferences.getInstance();
//await prefs.clear();
    //read json file
    final jsondata = prefs.getString('requests');
    if (jsondata == null) {
      final jsondataFromAssets = await rootBundle.rootBundle
          .loadString('lib/assets/data/requests.json');
      await prefs.setString('requests', jsondataFromAssets);

      final list = json.decode(jsondataFromAssets) as List<dynamic>;
      //map json and initialize using DataModel
      return list.map((e) => Request.fromJson(e)).toList();
    } else {
      //decode json data as list
      final list = json.decode(jsondata) as List<dynamic>;
      //map json and initialize using DataModel
      return list.map((e) => Request.fromJson(e)).toList();
    }
  }

  static Future<void> updateStatus(int id, String newStatus) async {
    final prefs = await SharedPreferences.getInstance();

    //read json file
    final jsondata = prefs.getString('requests');
    //decode json data as list
    final list = json.decode(jsondata!) as List<dynamic>;
    //map json and initialize using DataModel
    var toUpdate = list.firstWhere((element) => element['id'] == id);
    list.removeWhere((element) => element['id'] == id);
    toUpdate['status'] = newStatus;
    list.add(toUpdate);
    prefs.setString('requests', json.encode(list));
  }
}
