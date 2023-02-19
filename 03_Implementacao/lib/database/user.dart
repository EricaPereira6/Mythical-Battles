
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'relic.dart';

import '../constants/db_constants.dart';
import 'hero.dart';

class User {

  // divergent 100% || AIR Tribe 100%

  final String  _userId;
  int?    _phoneNumber;
  String? _name;
  int?    _level;
  int?    _exp;
  int?    _fusion;
  int?    _gems;
  String? _timeCollected;
  int?    _chapter;
  int?    _part;
  Her0?   _first;
  Her0?   _second;
  Her0?   _third;
  Her0?   _fourth;

  static const int _defaultLevel   = 1;
  static const int _defaultExp     = 0;
  static const int _defaultFusion  = 0;
  static const int _defaultGems    = 10;
  static const int _defaultChapter = 1;
  static const int _defaultPart    = 1;


  List<Her0>  _myHeroes = [];
  List<Relic> _myRelics = [];

  User(this._userId, {phone, name, level, exp, fusion, gems, time, chapter, part,
    firstHero, secondHero, thirdHero, fourthHero}) {
    _level = level ?? _defaultLevel;
    _exp = exp ?? _defaultExp;
    _fusion = fusion ?? _defaultFusion;
    _gems = gems ?? _defaultGems;
    _chapter = chapter ?? _defaultChapter;
    _part = part ?? _defaultPart;
    _timeCollected = time ?? DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    _myHeroes = [];
    _myRelics = [];
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
                    data[DBConstants.userIDCol],
        phone:      data[DBConstants.userPhoneCol],
        name:       data[DBConstants.userNameCol],
        level:      data[DBConstants.userLevelCol],
        exp:        data[DBConstants.userEXPCol],
        fusion:     data[DBConstants.userFusionCol],
        gems:       data[DBConstants.userGemsCol],
        time:       data[DBConstants.userTimeCol],
        chapter:    data[DBConstants.userChapterCol],
        part:       data[DBConstants.userPartCol],
        firstHero:  data[DBConstants.userFirstCol],
        secondHero: data[DBConstants.userSecondCol],
        thirdHero:  data[DBConstants.userThirdCol],
        fourthHero: data[DBConstants.userFourthCol]
  );

  Map<String, dynamic> toMap(){
    return {
      DBConstants.userIDCol      : _userId,
      DBConstants.userPhoneCol   : _phoneNumber,
      DBConstants.userNameCol    : _name,
      DBConstants.userLevelCol   : _level,
      DBConstants.userEXPCol     : _exp,
      DBConstants.userFusionCol  : _fusion,
      DBConstants.userGemsCol    : _gems,
      DBConstants.userTimeCol    : _timeCollected,
      DBConstants.userChapterCol : _chapter,
      DBConstants.userPartCol    : _part,
      DBConstants.userFirstCol   : _first,
      DBConstants.userSecondCol  : _second,
      DBConstants.userThirdCol   : _third,
      DBConstants.userFourthCol  : _fourth
    };
  }

  printUser() {
    if (kDebugMode) {
      print("user:$_userId -> level:$_level, time:$_timeCollected");
    }
  }

  addMyHero(Her0 hero) {
    _myHeroes.add(hero);
  }
  addMyHeroesFromMap(List<Map<String, dynamic>> data) {
    _myHeroes = [];
    for (var element in data) {
      _myHeroes.add(Her0.fromMap(element));
    }
  }
  updateHero(Her0 hero, int index) {
    _myHeroes[index] = hero;
  }
  resetMyHeroes() {
    _myHeroes = [];
  }
  List<Her0>? getMyHeroes() {
    return _myHeroes;
  }

  addMyRelic(Relic relic) {
    _myRelics.add(relic);
  }
  addMyRelicsFromMap(List<Map<String, dynamic>> data) {
    _myRelics = [];
    for (var element in data) {
      _myRelics.add(Relic.fromMap(element));
    }
  }
  updateRelic(Relic relic, int index) {
    _myRelics[index] = relic;
  }
  resetMyRelics() {
    _myRelics = [];
  }
  List<Relic>? getMyRelics() {
    return _myRelics;
  }
  List<Relic>? getMyAvailableRelics() {
    return _myRelics;
  }

  String getUserId() {
    return _userId;
  }

  String? getUserName() {
    return _name;
  }
  void setUserName(String name) {
    _name = name;
  }

  int? getPhoneNumber() {
    return _phoneNumber;
  }
  void setPhoneNumber(int phoneNumber) {
    _phoneNumber = phoneNumber;
  }


  int? getUserLevel() {
    return _level;
  }
  void setUserLevel(int level) {
    _level = level;
  }

  int? getEXPPoints() {
    return _exp;
  }
  void setEXPPoints(int exp) {
    _exp = exp;
  }

  int? getFusionPoints() {
    return _fusion;
  }
  void setFusionPoints(int fusion) {
    _fusion = fusion;
  }

  int? getUserGems() {
    return _gems;
  }
  void setUserGems(int gems) {
    _gems = gems;
  }


  String? getTimeCollected() {
    return _timeCollected;
  }
  void setTimeCollected(String timeCollected) {
    _timeCollected = timeCollected;
  }


  int? getUserChapter() {
    return _chapter;
  }
  void setUserChapter(int chapter) {
    _chapter = chapter;
  }
  int? getUserPart() {
    return _part;
  }
  void setUserPart(int part) {
    _part = part;
  }

  Her0? getUserFirstHero() {
    return _first;
  }
  void setUserFirstHero(Her0 first) {
    _first = first;
  }

  Her0? getUserSecondHero() {
    return _second;
  }
  void setUserSecondHero(Her0 second) {
    _second = second;
  }

  Her0? getUserThirdHero() {
    return _third;
  }
  void setUserThirdHero(Her0 third) {
    _third = third;
  }

  Her0? getUserFourthHero() {
    return _fourth;
  }
  void setUserFourthHero(Her0 fourth) {
    _fourth = fourth;
  }
}