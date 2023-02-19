import '../constants/assets_constants.dart';
import '../constants/db_constants.dart';
import 'character.dart';

class Item {

  final String   _name;
  final Elements _element;
  final int      _initialLife;
  final int      _initialPower;
  Character?     _heroOwner;

  Item(this._name, this._element, this._initialLife, this._initialPower, {heroOwner}) {
    _heroOwner = heroOwner;
  }

  factory Item.fromRTDB(Map<String, dynamic> data)  => Item(
      data[DBConstants.itemNameCol],
      AssetsConstants.elementsName[data[DBConstants.itemElementCol]]!,
      data[DBConstants.itemInitLifeCol],
      data[DBConstants.itemInitPowerCol],
  );

  Map<String, dynamic> toMap(){
    return {
      DBConstants.itemNameCol      : _name,
      DBConstants.itemElementCol   : AssetsConstants.elementsStr[_element],
      DBConstants.itemInitLifeCol  : _initialLife,
      DBConstants.itemInitPowerCol : _initialPower,
      DBConstants.itemHeroCol      : _heroOwner?.getName()
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


  Character? getCharacter(){
    return _heroOwner;
  }
}