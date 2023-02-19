import '../constants/assets_constants.dart';
import '../constants/db_constants.dart';

class Character {

  final String   _name;
  final Elements _element;
  final int      _initialLife;
  final int      _initialPower;
  final int      _tier;
  final String   _type;
  String? _phrase;
  String? _specialPower;
  String? _history;

  Heroes? _hero;

  Character(this._name, this._element, this._type, this._tier, this._initialLife,
      this._initialPower, {phrase, specialPower, history}) {
    _phrase       = phrase ?? '';
    _specialPower = specialPower ?? '';
    _history      = history ?? '';

    _hero         = setHero();
  }

  factory Character.fromRTDB(Map<String, dynamic> data)  => Character(
      data[DBConstants.characterNameCol],
      AssetsConstants.elementsName[data[DBConstants.characterElementCol]]!,
      data[DBConstants.characterInitLifeCol],
      data[DBConstants.characterInitPowerCol],
      data[DBConstants.characterTierCol],
      data[DBConstants.characterTypeCol],
      phrase:       data[DBConstants.characterPhraseCol],
      specialPower: data[DBConstants.characterSpecialCol],
      history:      data[DBConstants.characterHistoryCol]
  );

  Map<String, dynamic> toMap(){
    return {
    DBConstants.characterNameCol      : _name,
    DBConstants.characterElementCol   : AssetsConstants.elementsStr[_element],
    DBConstants.characterInitLifeCol  : _initialLife,
    DBConstants.characterInitPowerCol : _initialPower,
    DBConstants.characterTierCol      : _tier,
    DBConstants.characterTypeCol      : _type,
    DBConstants.characterPhraseCol    : _phrase,
    DBConstants.characterSpecialCol   : _specialPower,
    DBConstants.characterHistoryCol   : _history
    };
  }

  String getName() {
    return _name;
  }

  Elements getElement() {
    return _element;
  }

  int getInitialLife() {
    return _initialLife;
  }

  int getInitialPower() {
    return _initialPower;
  }

  int getTier() {
    return _tier;
  }

  String getType() {
    return _type;
  }

  String? getPhrase() {
    return _phrase;
  }

  String? getSpecialPower() {
    return _specialPower;
  }

  String? getHistory() {
    return _history;
  }

  Heroes? getHero(){
    return _hero;
  }

  Heroes? setHero() {
    return AssetsConstants.heroesName[_name];
  }
}