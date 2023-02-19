import 'package:mythical_battles_project_65/database/database_reference.dart';
import 'package:mythical_battles_project_65/database/relic.dart';

import '../constants/assets_constants.dart';
import '../constants/db_constants.dart';
import 'character.dart';

class Her0 {

  final String _heroId;
  int?    _level;
  int?    _life;
  int?    _power;
  String  _relicId = "";
  Relic?  _relic;

  Character? _character;

  Her0(this._heroId, {level, character, relic}) {
    _level = level ?? 1;
    _character = character;
    _relicId = relic ?? "";

    setRelic();

    if (_character != null) {
      setHeroStats();
    }
  }
  factory Her0.defaultHero() => Her0(
      "default",
      level: 0,
      character: null
  );

  factory Her0.fromMap(Map<String, dynamic> data) => Her0(
      data[DBConstants.heroIDCol],
      level:     data[DBConstants.heroLevelCol],
      character: DBConstants.characters[AssetsConstants.heroesName[data[DBConstants.heroNameCol]]]!,
      relic:     data[DBConstants.heroRelicCol]
  );

  Map<String, dynamic> toMap(){
    return {
      DBConstants.heroIDCol:    _heroId,
      DBConstants.heroNameCol:  _character?.getName(),
      DBConstants.heroLevelCol: _level,
      DBConstants.heroLifeCol:  _life,
      DBConstants.heroPowerCol: _power,
      DBConstants.heroRelicCol: _relicId
    };
  }

  void setHeroStats() {
    bool typeOffense = (_character!.getType() == "Offense");
    int life =  _character!.getInitialLife();
    int power = _character!.getInitialPower();

    int level = _level!;

    _power = power + (level - 1) + (level ~/ 10);
    _life =  (_power! * life) ~/ power;

    if (typeOffense) {
      _power = _power! + (level ~/ 10);
    }
    else {
      _life = life + (level - 1) + (level ~/ 10);
      _power = (_life! * power) ~/ life;
      _life =   _life! + (level ~/ 10);
    }

    if (_relicId != "" && _relic != null) {
      _life =  _life! +  _relic!.getRelicLife()!;
      _power = _power! + _relic!.getRelicPower()!;
    }
  }

  String getHeroId() {
    return _heroId;
  }

  int? getHeroLevel() {
    return _level;
  }

  int? getHeroLife() {
    return _life;
  }
  int? getHeroPower() {
    return _power;
  }

  Character? getCharacter() {
    return _character;
  }

  void setRelicId(String id) {
    _relicId = id;
  }
  void setRelic() async {
    if (_relicId != "") {
      List<Map<String, dynamic>> data = await DatabaseReference.getRelic(_relicId);
      for (var element in data) {
        _relic = Relic.fromMap(element);
        setHeroStats();
      }
    }
  }
  void resetRelic() {
    _relic = null;
  }
  Relic? getRelic() {
    return _relic;
  }

  Heroes getHero() {
    if (_character == null) {
      return Heroes.DEFAULT_HERO;
    }
    return AssetsConstants.heroesName[_character!.getName()]!;
  }
}