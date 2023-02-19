
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/screens/equip_page/equip_page.dart';
import 'vibration.dart';

import 'audio.dart';
import 'constants/assets_constants.dart';
import 'constants/screen_constants.dart';

import 'database/hero.dart';
import 'game_controller.dart';
import 'screens/audio_page/audio_page.dart';
import 'screens/bag_page/bag_page.dart';
import 'screens/hero_page/hero_page.dart';
import 'screens/heroes_page/heroes_page.dart';
import 'screens/main_page/main_page.dart';
import 'screens/battle_page/battle_page.dart';
import 'screens/fight_page/fight_page.dart';
import 'screens/battle_page/battle_result_page.dart';
import 'screens/definitions_page/definitions_page.dart';
import 'screens/my_heroes_page/my_heroes_page.dart';
import 'screens/my_relics_page/my_relics_page.dart';
import 'screens/other_items_page/other_items_page.dart';
import 'screens/rules_page/rules_page.dart';
import 'screens/select_heroes_page/choose_position_page.dart';
import 'screens/store_page/store_page.dart';
import 'screens/opponents_page/opponents_page.dart';
import 'screens/select_heroes_page/select_heroes_page.dart';
import 'screens/account_page/account_page.dart';
import 'screens/audio_page/change_audio_page.dart';
import 'screens/tutorials_page/tutorials_page.dart';
import 'screens/language_page/language_page.dart';

class ChangePage {

  static const _milliseconds = 500;

  static toSetterPage(context, Screens screen){
    switch(screen){
      case Screens.MAIN_PAGE:
        toMainPage(context);
        break;
      case Screens.BATTLE_PAGE:
        toBattlePage(context);
        break;
      case Screens.DEFINITIONS_PAGE:
        toDefinitionsPage(context);
        break;
      case Screens.STORE_PAGE:
        toStorePage(context);
        break;
      case Screens.BAG_PAGE:
        toBagPage(context);
        break;
      case Screens.CHOOSE_POSITION_PAGE:
        toChoosePositionPage(context);
        break;
      case Screens.OPPONENTS_PAGE:
        toOpponentsPage(context);
        break;
      case Screens.RULES_PAGE:
        toRulesPage(context);
        break;
      case Screens.FIGHT_PAGE:
        toFightPage(context);
        break;
      case Screens.MY_HEROES_PAGE:
        toMyHeroesPage(context);
        break;
      case Screens.HEROES_PAGE:
        toHeroesPage(context);
        break;
      case Screens.MY_RELICS_PAGE:
        toMyRelicsPage(context);
        break;
      case Screens.OTHER_ITEMS_PAGE:
        toOtherItemsPage(context);
        break;
      case Screens.RESULT_PAGE:
        toResultPage(context);
        break;
      case Screens.AUDIO_PAGE:
        toAudioPage(context);
        break;
      case Screens.ACCOUNT_PAGE:
        toAccountPage(context);
        break;
      case Screens.LANGUAGE_PAGE:
        toLanguagePage(context);
        break;
      case Screens.TUTORIALS_PAGE:
        toTutorialsPage(context);
        break;
      case Screens.CHANGE_AUDIO_PAGE:
        toChangeAudioPage(context);
        break;
      default:
        if (kDebugMode) {
          print("No screen selected to change page");
        }
        break;
    }
  }

  static toMainPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.MAIN_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }

  static toBattlePage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.BATTLE_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BattlePage()),
    );
  }
  static toDefinitionsPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.DEFINITIONS_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DefinitionsPage()),
    );
  }
  static toStorePage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.STORE_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StorePage()),
    );
  }
  static toBagPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.BAG_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BagPage()),
    );
  }

  static toChoosePositionPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.CHOOSE_POSITION_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChoosePositionPage()),
    );
  }
  static toSelectHeroesPage(context, int position){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.SELECT_HEROES_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    GameController.setSelectedPosition(position);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectHeroesPage()),
    );
  }
  static toOpponentsPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.OPPONENTS_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OpponentsPage()),
    );
  }
  static toRulesPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.RULES_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RulesPage()),
    );
  }
  static toFightPage(context){
    if (GameController.getHeroFighters().length == 4) {
      Audio.waitingToPlay(
          [AssetsConstants.audioButton, Audio.getAudio(Screens.FIGHT_PAGE)],
          audioVoiceType: false, faster: _milliseconds);
      GameController.setBeginFight(true);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FightPage()),
      );
    }
    else {
      Audio.play(AssetsConstants.audioSelecionarHeroes, audioVoiceType: true);
      Vibration.intenseVibration(5, 60);
    }
  }

  static toResultPage(context){
    // Audio.play(AssetsConstants.resultAudio[GameController.hasWon()]!, audioVoiceType: false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BattleResultPage()),
    );
  }

  static toMyHeroesPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.MY_HEROES_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHeroesPage()),
    );
  }
  static toHeroesPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.HEROES_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HeroesPage()),
    );
  }
  static toMyRelicsPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.MY_RELICS_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyRelicsPage()),
    );
  }
  static toOtherItemsPage(context){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.OTHER_ITEMS_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtherItemsPage()),
    );
  }
  static toHeroPage(context, Her0 hero, {required bool isMyHeroPage}){
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, AssetsConstants.heroesAudioPhrases[hero.getHero()]!],
        audioVoiceType: false, faster: _milliseconds, isHeroPhrase: true);
    GameController.setCurrentHeroPage(hero);
    GameController.setHeroPage(isMyHeroPage);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HeroPage()),
    );
  }


  static toAudioPage(context) {
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.AUDIO_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AudioPage()),
    );
  }
  static toAccountPage(context) {
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.ACCOUNT_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AccountPage()),
    );
  }
  static toLanguagePage(context) {
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.LANGUAGE_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LanguagePage()),
    );
  }
  static toTutorialsPage(context) {
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.TUTORIALS_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TutorialsPage()),
    );
  }
  static toChangeAudioPage(context) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChangeAudioPage()),
    );
  }

  static toEquipPage(context) {
    Audio.waitingToPlay(
        [AssetsConstants.audioButton, Audio.getAudio(Screens.EQUIP_PAGE)],
        audioVoiceType: false, faster: _milliseconds);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectRelicsPage()),
    );
  }
}