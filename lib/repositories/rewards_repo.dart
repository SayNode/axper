import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

import '../models/rewards.dart';

class RewardRepository {
  late List<Reward> _rewards;


  List<Reward> get rewards => _rewards;

  Future<bool> init() async {
    _rewards = await loadRewards();
    return true;
  }



  static Future<List<Reward>> loadRewards() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('lib/assets/data/rewards.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => Reward.fromJson(e)).toList();
  }
}
