import 'dart:convert';
import '../models/activities.dart';

class ActivitesRepo {
  static List<Activites> loadActivites(String jsondata) {
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => Activites.fromJson(e)).toList();
  }
}
