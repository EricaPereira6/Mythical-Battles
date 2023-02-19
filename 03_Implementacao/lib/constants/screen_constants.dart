import 'dart:math';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

import 'db_constants.dart';
import 'assets_constants.dart';

enum Quadrants {
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT
}

enum Screens {
  MAIN_PAGE, BATTLE_PAGE, DEFINITIONS_PAGE, STORE_PAGE, BAG_PAGE,
  CHOOSE_POSITION_PAGE, OPPONENTS_PAGE, RULES_PAGE, FIGHT_PAGE,
  MY_HEROES_PAGE, HEROES_PAGE, MY_RELICS_PAGE, OTHER_ITEMS_PAGE,
  TUTORIALS_PAGE, ACCOUNT_PAGE, AUDIO_PAGE, LANGUAGE_PAGE,
  CHANGE_AUDIO_PAGE,
  RESULT_PAGE,
  SELECT_HEROES_PAGE, HERO_PAGE, EQUIP_PAGE,
  DEFAULT_PAGE
}

enum AudioChange {
  VOICE, SOUND, SPEED
}

class ScreenConstants {

  static double screenWidth = 0;
  static double screenHeight = 0;
  static double screenBarHeight = 56;
  static setScreenWidth(double width) {
    screenWidth = width;
  }
  static setScreenHeight(double height) {
    screenHeight = height;
  }
  static setBarHeight(double height) {
    screenBarHeight = height;
    if (kDebugMode) {
      //print("--------------> baaar height -> $height");
    }
  }

  static int pageIndex = 0;
  static updateIndex(bool up, int numHeroes, int index) {
    if (up) {
      int lastSetOffset = ((numHeroes % 4) == 0) ? 4 : (numHeroes % 4);
      int maxIndex = max(0, numHeroes - lastSetOffset);
      index = min(maxIndex, (index + 4));
    }
    else {
      index = max(0, (index - 4));
    }
    pageIndex = index;
    return index;
  }

  static AudioChange changeAudioPage = AudioChange.VOICE;

  static const double bannerHeight = 60;
  static const double bannerTextPadding = 4;
  static const double bannerTextSize = 25;

  static const double imageMenuRatio = 3;
  static const double imageMenuHeightRatio = 6;
  static const double imageHeroMenuRatio = 2.5;

  static const double resultTextSize = 35;
  static const double titleTextSize = 30;


  static const String rewardTitle = "Recompensas";

  static const String mainPageTitle = "MENU";

  static const String battlePageTitle = "CAPÍTULO";
  static const String definitionPageTitle = "DEFINIÇÕES";
  static const String storePageTitle = "LOJA";
  static const String bagPageTitle = "BOLSA";

  static const String selectHeroesPageTitle = "SELECIONAR HERÓIS";
  static const String selectRelicPageTitle = "SELECIONAR RELÍQUIA";
  static const String choosePositionPageTitle = "ESCOLHER POSIÇÕES";
  static const String opponentsPageTitle = "INIMIGOS";
  static const String rulesPageTitle = "REGRAS DO JOGO";
  static const String fightPageTitle = "LUTAR!";

  static const String myHeroesPageTitle = "HERÓIS ADQUIRIDOS";
  static const String heroesPageTitle = "HERÓIS";
  static const String myRelicsPageTitle = "RELÍQUIAS ADQUIRIDAS";
  static const String otherItemsPageTitle = "OUTROS ITENS";

  static const String tutorialsPageTitle = "TUTORIAIS";
  static const String languagePageTitle = "ALTERAR IDIOMA";
  static const String accountPageTitle = "VINCULAR CONTA";
  static const String audioPageTitle = "ÁUDIO";

  static const String volumeVoicePageTitle = "VOLUME VOZ";
  static const String volumeSoundPageTitle = "VOLUME SOM";
  static const String velocityPageTitle = "VELOCIDADE VOZ";


  // ---------------------- main page ----------------------
  static const List<String> mainPageTitles = ["Batalha", "Definições", "Loja", "Bolsa"];

  static const List<Screens> mainPageScreens = [Screens.BATTLE_PAGE,
    Screens.DEFINITIONS_PAGE, Screens.STORE_PAGE, Screens.BAG_PAGE];

  static const List<String> mainPageImageSrcs = [
    AssetsConstants.battleImageSrc,
    AssetsConstants.definitionImageSrc,
    AssetsConstants.storeImageSrc,
    AssetsConstants.bagImageSrc];

  static const List<Color> mainPageColors = [AssetsConstants.screenColor1,
  AssetsConstants.screenColor2, AssetsConstants.screenColor2, AssetsConstants.screenColor1];



  // ---------------------- battle page ----------------------
  static const List<String> battlePageTitles = ["Selecionar\nHeróis", "Ver\nOponentes",
    "Regras do\nJogo", "Combater"];

  static const List<Screens> battlePageScreens = [Screens.CHOOSE_POSITION_PAGE,
    Screens.OPPONENTS_PAGE, Screens.RULES_PAGE, Screens.FIGHT_PAGE];

  static const List<String> battlePageImageSrcs = [
    AssetsConstants.heroImageSrc,
    AssetsConstants.enemyImageSrc,
    AssetsConstants.rulesImageSrc,
    AssetsConstants.fightImageSrc];

  static const List<Color> battlePageColors = [AssetsConstants.screenColor2,
    AssetsConstants.screenColor1, AssetsConstants.screenColor1, AssetsConstants.screenColor2];



  // ---------------------- bag page ----------------------
  static const List<String> bagPageTitles = ["Heróis\nadquiridos", "Todos os\nHeróis",
    "Relíquias\nadquiridas", "Outros\nItens"];

  static const List<Screens> bagPageScreens = [Screens.MY_HEROES_PAGE,
    Screens.HEROES_PAGE, Screens.MY_RELICS_PAGE, Screens.OTHER_ITEMS_PAGE];

  static List<String> bagPageImageSrcs = [
    AssetsConstants.myHeroesImageSrc,
    AssetsConstants.allHeroesImageSrc,
    AssetsConstants.relicsImageSrcs[Relics.CHALICE]!,
    AssetsConstants.fusionImageScr];

  static const List<Color> bagPageColors = [AssetsConstants.screenColor2,
    AssetsConstants.screenColor1, AssetsConstants.screenColor1, AssetsConstants.screenColor2];



  // --------------------- Definitions page ------------------------
  static const List<String> definitionsPageTitles = ["Áudio", "Vincular\nConta",
    "Vibração", "Tutoriais e\nPerguntas\nFrequentes"];

  static const List<Screens> definitionsPageScreens = [Screens.AUDIO_PAGE,
    Screens.ACCOUNT_PAGE, Screens.DEFAULT_PAGE, Screens.TUTORIALS_PAGE];

  static const List<String> definitionsPageImageSrcs = ["", "", "", ""];

  static const List<Color> definitionsPageColors = [AssetsConstants.screenColor3,
    AssetsConstants.screenColor4, AssetsConstants.screenColor4, AssetsConstants.screenColor3];



  // --------------------- Audio page ------------------------
  static const List<String> audioPageTitles = ["Volume\nVoz", "Volume\nSons",
    "Velocidade\nVoz", "Idioma"];

  static const List<Screens> audioPageScreens = [Screens.CHANGE_AUDIO_PAGE,
    Screens.CHANGE_AUDIO_PAGE, Screens.CHANGE_AUDIO_PAGE, Screens.LANGUAGE_PAGE];

  static const List<String> audioPageImageSrcs = ["", "", "", ""];

  static const List<Color> audioPageColors = [AssetsConstants.screenColor4,
    AssetsConstants.screenColor3, AssetsConstants.screenColor3, AssetsConstants.screenColor4];
}