
import '../constants/db_constants.dart';

class Chapter {
  final int _chapterNumber;
  final int _partNumber;
  final int _heroLevel;
  String? _firstOpponent;
  String? _secondOpponent;
  String? _thirdOpponent;
  String? _fourthOpponent;

  Chapter(this._chapterNumber, this._partNumber, this._heroLevel, {firstOpponent, secondOpponent,
    thirdOpponent, fourthOpponent}) {
    _firstOpponent = firstOpponent;
    _secondOpponent = secondOpponent;
    _thirdOpponent = thirdOpponent;
    _fourthOpponent = fourthOpponent;
  }

  factory Chapter.fromRTDB(Map<String, dynamic> data)  => Chapter(
      data[DBConstants.chapterCol],
      data[DBConstants.chapterPartCol],
      data[DBConstants.chapterLevelCol],
      firstOpponent:  data[DBConstants.chapterFirstCol],
      secondOpponent: data[DBConstants.chapterSecondCol],
      thirdOpponent:  data[DBConstants.chapterThirdCol],
      fourthOpponent: data[DBConstants.chapterFourthCol]
  );

  Map<String, dynamic> toMap(){
    return {
    DBConstants.chapterCol:       _chapterNumber,
      DBConstants.chapterPartCol: _partNumber,
    DBConstants.chapterLevelCol:  _heroLevel,
    DBConstants.chapterFirstCol:  _firstOpponent,
    DBConstants.chapterSecondCol: _secondOpponent,
    DBConstants.chapterThirdCol:  _thirdOpponent,
    DBConstants.chapterFourthCol: _fourthOpponent
    };
  }

  int getChapterNumber() {
    return _chapterNumber;
  }

  int getPartNumber() {
    return _partNumber;
  }

  int getOpponentsLevel() {
    return _heroLevel;
  }

  String? getFirstOpponent() {
    return _firstOpponent;
  }
  setFirstOpponent(String name) {
    _firstOpponent = name;
  }
  setFirstOpponentWithHero(Heroes hero) {
    String name = DBConstants.characters[hero]!.getName();
    _firstOpponent = name;
  }

  String? getSecondOpponent() {
    return _secondOpponent;
  }
  setSecondOpponent(String name) {
    _secondOpponent = name;
  }
  setSecondOpponentWithHero(Heroes hero) {
    String name = DBConstants.characters[hero]!.getName();
    _secondOpponent = name;
  }
  String? getThirdOpponent() {
    return _thirdOpponent;
  }
  setThirdOpponent(String name) {
    _thirdOpponent = name;
  }
  setThirdOpponentWithHero(Heroes hero) {
    String name = DBConstants.characters[hero]!.getName();
    _thirdOpponent = name;
  }
  String? getFourthOpponent() {
    return _fourthOpponent;
  }
  setFourthOpponent(String name) {
    _fourthOpponent = name;
  }
  setFourthOpponentWithHero(Heroes hero) {
    String name = DBConstants.characters[hero]!.getName();
    _fourthOpponent = name;
  }
}