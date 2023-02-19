import 'package:mythical_battles_project_65/constants/assets_constants.dart';
import 'package:mythical_battles_project_65/constants/db_constants.dart';

import 'character.dart';
import 'item.dart';

class Relic {
  final String _relicId;
  int? _level;
  int? _life;
  int? _power;

  Item? _item;

  Relic(this._relicId, {level, item}) {
    _level = level ?? 1;
    _item = item;
    if (_item != null) {
      setRelicStats();
    }
  }
  factory Relic.defaultRelic() => Relic(
      "default",
      level: 0,
      item: null
  );

  factory Relic.fromMap(Map<String, dynamic> data) => Relic(
      data[DBConstants.relicIDCol],
      level: data[DBConstants.relicLevelCol],
      item: DBConstants.items[AssetsConstants.relicsName[data[DBConstants.relicNameCol]]]!
  );

  Map<String, dynamic> toMap(){
    return {
      DBConstants.relicIDCol:    _relicId,
      DBConstants.relicNameCol:  _item!.getName(),
      DBConstants.relicLevelCol: _level,
      DBConstants.relicLifeCol:  _life,
      DBConstants.relicPowerCol: _power
    };
  }

  void setRelicStats() {
    int life = _item!.getInitialLife();
    int power = _item!.getInitialPower();

    int level = _level!;

    _power = power + (level - 1) + (level ~/ 10);
    _life = (_power! * life) ~/ power;

    if (power > life) {
      _power = _power! + (level ~/ 10);
    }
    else {
      _life = life + (level - 1) + (level ~/ 10);
      _power = (_life! * power) ~/ life;
      _life = _life! + (level ~/ 10);
    }
  }

  String getRelicId() {
    return _relicId;
  }

  int? getRelicLevel() {
    return _level;
  }

  int? getRelicLife() {
    return _life;
  }
  int? getRelicPower() {
    return _power;
  }

  Item? getItem() {
    return _item;
  }

  Relics getRelic() {
    if (_item == null) {
      return Relics.DEFAULT_RELIC;
    }
    return AssetsConstants.relicsName[_item!.getName()]!;
  }
}