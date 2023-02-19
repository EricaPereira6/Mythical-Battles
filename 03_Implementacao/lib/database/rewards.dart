
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../constants/db_constants.dart';

class Rewards {

  int      _level;
  DateTime _timeLimit;

  Rewards(this._level, this._timeLimit);

  factory Rewards.fromMap(Map<String, dynamic> data) => Rewards(
      data[DBConstants.rewardLevelCol],
      DateTime.parse("1970-01-01 ${data[DBConstants.rewardTimeCol]}"),
  );

  Map<String, dynamic> toMap(){
    return {
      DBConstants.rewardLevelCol : _level,
      DBConstants.rewardTimeCol  : _timeLimit,
    };
  }

  printRewards() {
    if (kDebugMode) {
      print("reward -> level:$_level, time limit:$_timeLimit");
    }
  }

  int getUserLevel() {
    return _level;
  }

  DateTime getTimeLimit() {
    return _timeLimit;
  }
  void setTimeLimit(DateTime timeLimit) {
    _timeLimit = timeLimit;
  }

  String getStringTimeLimit(){
    // String dateStart = '1970-01-01 12:00:00';
    // DateTime time = DateTime.parse(dateStart);
    // String inputStr = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.parse(dateStart));
    return DateFormat('hh:mm:ss').format(_timeLimit);
  }

}