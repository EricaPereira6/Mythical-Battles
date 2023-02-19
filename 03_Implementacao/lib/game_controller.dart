
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'constants/assets_constants.dart';
import 'constants/db_constants.dart';
import 'database/database_reference.dart';
import 'database/chapter.dart';
import 'database/hero.dart';
import 'database/rewards.dart';
import 'database/user.dart';


class GameController {

  static Future<String> generatePhoneId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor.toString(); // unique ID on iOS
    }
    else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId.toString(); // unique ID on Android
    }
    // or you can use DateTime.now().millisecondsSinceEpoch
    //return UniqueKey().hashCode.toString();

    // Generate a v4 (random) id
    return const Uuid().v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
  }
  static String generateId() {
    // or you can use DateTime.now().millisecondsSinceEpoch
    //return UniqueKey().hashCode.toString();

    // Generate a v4 (random) id
    return const Uuid().v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
  }


  static String collectReward(DateTime lastTime) {
    DateTime now = DateTime.now();
    Duration diff = now.difference(lastTime);

    if (kDebugMode) {
      print("diff.inHours:${diff.inHours}");
    }
    int h = diff.inHours;
    int m = diff.inMinutes;
    int s = diff.inSeconds;

    h = (h < 0) ? h*-1 : h;
    m = (m < 0) ? m*-1 : m;
    s = (s < 0) ? s*-1 : s;

    Rewards rewards = getRewards();

    String timePassed = '';
    int levelHours = rewards.getTimeLimit().hour;

    if (kDebugMode) {
      // print("h > levelHours: ${(h > levelHours)}");
    }

    if (h > levelHours) {
      int levelSeconds = levelHours * 60 * 60;
      setRewardValues(levelSeconds);

      DatabaseReference.updateTimeCollected();

      timePassed = rewards.getStringTimeLimit();
      return timePassed;
    }

    setRewardValues(s);

    int mins = (m < 60) ? m : (m % 60);
    int secs = (s < 60) ? s : (s % 60);

    String hours   = (h < 10)    ? "0$h"    : "$h";
    String minutes = (mins < 10) ? "0$mins" : "$mins";
    String seconds = (secs < 10) ? "0$secs" : "$secs";

    timePassed = "$hours:$minutes:$seconds";

    DatabaseReference.updateTimeCollected();

    return timePassed;
  }

  static setRewardValues(int secondsPassed) {
    double num = secondsPassed * 0.2;  // 2h total -> 7200 * 0.2 = 1440
    setExpReward(       num ~/ 2);   // 720 EXP
    setFusionReward(    num ~/ 8);   // 180 Fusion
    setGemsReward(      num ~/ 32);  // 45  gems
    setNumRelicsReward( num ~/ 256); // 5   relics
  }

  static chapterEnemies() async {

    User user = getUser();

    Chapter chapter = await DatabaseReference.getChapter(
        user.getUserChapter()!, user.getUserPart()!);

    setChapterOpponentsLevel(chapter.getOpponentsLevel());

    bool update = false;

    Heroes heroName;
    if (chapter.getFirstOpponent() != null) {
      heroName = AssetsConstants.heroesName[chapter.getFirstOpponent()]!;
    }
    else {
      int firstIndex = Random().nextInt(Heroes.values.length - 1);
      heroName = Heroes.values[firstIndex];
      chapter.setFirstOpponentWithHero(Heroes.values[firstIndex]);
      update = true;
    }
    Her0 opponent = Her0("enemy1", level: getChapterOpponentsLevel(),
        character: DBConstants.characters[heroName]);
    setHeroOpponents(opponent, 0);

    if (chapter.getSecondOpponent() != null){
      heroName = AssetsConstants.heroesName[chapter.getSecondOpponent()]!;
    }
    else {
      int secondIndex = Random().nextInt(Heroes.values.length - 1);
      heroName = Heroes.values[secondIndex];
      chapter.setSecondOpponentWithHero(Heroes.values[secondIndex]);
      update = true;
    }
    opponent = Her0("enemy2", level: getChapterOpponentsLevel(),
        character: DBConstants.characters[heroName]);
    setHeroOpponents(opponent, 1);

    if (chapter.getThirdOpponent() != null) {
      heroName = AssetsConstants.heroesName[chapter.getThirdOpponent()]!;
    }
    else {
      int thirdIndex = Random().nextInt(Heroes.values.length - 1);
      heroName = Heroes.values[thirdIndex];
      chapter.setThirdOpponentWithHero(Heroes.values[thirdIndex]);
      update = true;
    }
    opponent = Her0("enemy3", level: getChapterOpponentsLevel(),
        character: DBConstants.characters[heroName]);
    setHeroOpponents(opponent, 2);

    if (chapter.getFourthOpponent() != null) {
      heroName = AssetsConstants.heroesName[chapter.getFourthOpponent()]!;
    }
    else {
      int fourthIndex = Random().nextInt(Heroes.values.length - 1);
      heroName = Heroes.values[fourthIndex];
      chapter.setFourthOpponentWithHero(Heroes.values[fourthIndex]);
      update = true;
    }
    opponent = Her0("enemy4", level: getChapterOpponentsLevel(),
        character: DBConstants.characters[heroName]);
    setHeroOpponents(opponent, 3);


    if (update) {
      await DatabaseReference.updateChapter(chapter);
    }
  }

  static Map<String, int> fight(List<dynamic> heroStats, List<dynamic> enemyStats){

    Her0 hero = getHeroFighters()[heroIndex]!;
    Her0 enemy = getHeroOpponents()[enemyIndex]!;

    int heroLife =   heroStats[0];
    int heroForce =  heroStats[1];
    int enemyLife =  enemyStats[0];
    int enemyForce = enemyStats[1];
    int heroLevel =         hero.getHeroLevel()!;
    Elements heroElement =  hero.getCharacter()!.getElement();
    int enemyLevel =        enemy.getHeroLevel()!;
    Elements enemyElement = enemy.getCharacter()!.getElement();

    if ((heroElement == Elements.WATER && enemyElement == Elements.FIRE) ||
        (heroElement == Elements.FIRE  && enemyElement == Elements.AIR) ||
        (heroElement == Elements.AIR   && enemyElement == Elements.EARTH) ||
        (heroElement == Elements.EARTH && enemyElement == Elements.WATER)) {
      heroForce += heroLevel;
    }
    else if (
        (enemyElement == Elements.WATER && heroElement == Elements.FIRE) ||
        (enemyElement == Elements.FIRE  && heroElement == Elements.AIR) ||
        (enemyElement == Elements.AIR   && heroElement == Elements.EARTH) ||
        (enemyElement == Elements.EARTH && heroElement == Elements.WATER))  {
      enemyForce += enemyLevel;
    }

    heroLife = heroLife - enemyForce;
    enemyLife = enemyLife - heroForce;

    Map<String, int> defeated = {};

    if (heroLife <= 0) {
      defeated[hero.getHeroId()] = heroLife;
    }
    if (enemyLife <= 0) {
      defeated[enemy.getHeroId()] = enemyLife;
    }

    stats[0] = max(heroLife, 0);
    stats[1] = max(enemyLife, 0);

    return defeated;
  }



  // ------------------- Variables Setters and Getters -------------------------

  static late User user;
  static late Rewards rewards;

  static Map<int, Her0> heroOpponents = {};
  static Map<int, Her0> heroFighters = {};
  static List<int> stats = [0, 0];
  static bool beginFight = true;

  static int chapterOpponentsLevel = 1;
  static int selectedPosition = 1;

  static bool autoplay = false;
  static bool won = true;
  static bool end = false;
  static int heroIndex = 0;
  static int enemyIndex = 0;

  static double voiceSpeed = 1;
  static double voiceVolume = 1;
  static double soundVolume = 1;
  static bool muteVoice = false;
  static bool muteSound = false;
  static bool muteVibration = false;

  static int expReward = 0;
  static int gemsReward = 0;
  static int numRelicsReward = 0;
  static int fusionReward = 0;

  static Her0 currentHeroPage = Her0.defaultHero();
  static bool isMyHero = false;

  static void setUser(User newUser) {
    user = newUser;
  }
  static User getUser() {
    return user;
  }

  static void setRewards(Rewards newRewards) {
    rewards = newRewards;
  }
  static Rewards getRewards() {
    return rewards;
  }

  static void setHeroOpponents(Her0 opponent, int index) {
    heroOpponents[index] = opponent;
  }
  static Map<int, Her0> getHeroOpponents() {
    return heroOpponents;
  }
  static void setHeroFighters(Her0 fighter, int index) {
    heroFighters[index] = fighter;
  }
  static Map<int, Her0> getHeroFighters() {
    return heroFighters;
  }
  static void setBeginFight(bool begin) {
    beginFight = begin;
  }
  static bool canBeginFight() {
    return beginFight;
  }

  setHeroLife(int value){
    stats[0] = value;
  }
  setEnemyLife(int value){
    stats[1] = value;
  }
  static getHeroLife(){
    return stats[0];
  }
  static getEnemyLife(){
    return stats[1];
  }

  static void setChapterOpponentsLevel(int level) {
    chapterOpponentsLevel = level;
  }
  static int getChapterOpponentsLevel() {
    return chapterOpponentsLevel;
  }
  static void setSelectedPosition(int position) {
    selectedPosition = position;
  }
  static int getSelectedPosition() {
    return selectedPosition;
  }

  static void setAutoplay(bool auto) {
    autoplay = auto;
  }
  static bool isAutoplay() {
    return autoplay;
  }
  static void setWon(bool hasWon) {
    won = hasWon;
  }
  static bool hasWon() {
    return won;
  }
  static void setEndFight(bool hasEnd) {
    end = hasEnd;
  }
  static bool isEndFight() {
    return end;
  }
  static void setHeroIndex(int index) {
    heroIndex = index;
  }
  static int getHeroIndex() {
    return heroIndex;
  }
  static void setEnemyIndex(int index) {
    enemyIndex = index;
  }
  static int getEnemyIndex() {
    return enemyIndex;
  }

  static void setVoiceSpeed(double speed) {
    voiceSpeed = speed;
  }
  static double getVoiceSpeed(){
    return voiceSpeed;
  }
  static void setVoiceVolume(double volume) {
    voiceVolume = volume;
  }
  static double getVoiceVolume(){
    return voiceVolume;
  }
  static void setSoundVolume(double volume) {
    soundVolume = volume;
  }
  static double getSoundVolume() {
    return soundVolume;
  }
  static void setMuteVoice(bool mute) {
    muteVoice = mute;
  }
  static bool getMuteVoice() {
    return muteVoice;
  }
  static void setMuteSound(bool mute) {
    muteSound = mute;
  }
  static bool getMuteSound() {
    return muteSound;
  }
  static void setMuteVibration(bool mute) {
    muteVibration = mute;
  }
  static bool getMuteVibration() {
    return muteVibration;
  }

  static void setExpReward(int exp) {
    expReward = exp;
  }
  static int getExpReward() {
    return expReward;
  }
  static void setGemsReward(int gems) {
    gemsReward = gems;
  }
  static int getGemsReward() {
    return gemsReward;
  }
  static void setFusionReward(int fusion) {
    fusionReward = fusion;
  }
  static int getFusionReward() {
    return fusionReward;
  }
  static void setNumRelicsReward(int numRelics) {
    numRelicsReward = numRelics;
  }
  static int getNumRelicsReward() {
    return numRelicsReward;
  }

  static void setCurrentHeroPage(Her0 hero) {
    currentHeroPage = hero;
  }
  static Her0 getCurrentHeroPage() {
    return currentHeroPage;
  }

  static void setHeroPage(bool isMyHerOp) {
    isMyHero = isMyHerOp;
  }
  static bool isMyHeroPage() {
    return isMyHero;
  }
}