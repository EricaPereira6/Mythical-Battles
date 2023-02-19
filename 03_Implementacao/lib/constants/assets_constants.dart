import "package:flutter/material.dart";

import 'db_constants.dart';

class AssetsConstants {

  // -------------------------------- AUDIOS -----------------------------------

  static const String audioComingSoon =      "audio/coming_soon.mp3";         // "Brevemente"
  static const String audioStillToDiscover = "audio/still_to_discover.mp3";   // "Por Descobrir"

  static const String audioVictory =    "audio/victory.mp3";
  static const String audioDefeat =     "audio/defeated.mp3";

  static const Map<bool, String> audioResultSong = {true: audioVictory,
    false: audioDefeat};

  static const String audioPunch =       "audio/punch.mp3";
  static const String audioYeah =        "audio/success.wav";
  static const String audioWrong =       "audio/wrong.mp3";

  static const String audioLeftGame =    "audio/saiu.mp3";      // "Saiu do jogo"
  static const String audioNoHero =      "audio/nohero.mp3";    // "Sem Herói"
  static const String audioNoRelic =     "audio/norelic.mp3";    // "Sem Reliquia"

  static const String audioButton =      "audio/button.mp3";
  static const String audioMagicButton = "audio/magic.mp3";     // - add to merge and equip and leveling up

  static const String audioPlay =        "audio/play.mp3";      // "Play"
  static const String audioAutoPlay =    "audio/autoplay.mp3";  // "AutoPlay"

  // --------------- Screen Titles -------------------

  static const String audioMainPage =    "audio/screenTitles/main_page.mp3";                   // "Menu"

  static const String audioBatalha =     "audio/screenTitles/batalha_PT_female.mp3";           // "Batalha"
  static const String audioDefinicoes =  "audio/screenTitles/definicoes_PT_female.mp3";        // "Definições"
  static const String audioLoja =        "audio/screenTitles/loja_PT_female.mp3";              // "Loja"
  static const String audioBolsa =       "audio/screenTitles/bolsa_PT_female.mp3";             // "Bolsa"
  static const String audioRecompensas = "audio/screenTitles/recompensas_PT_female.mp3";       // "Recompensas"

  static const String audioCombater =         "audio/screenTitles/combater_PT_female.mp3";     // "Combater"
  static const String audioSelecionarHeroes = "audio/screenTitles/selecionar_PT_female.mp3";   // "Selecionar Heróis"
  static const String audioEscolherPosicao =  "audio/screenTitles/posicoes.mp3";               // "Escolher Posições"
  static const String audioVerOponentes =     "audio/screenTitles/oponentes_PT_female.mp3";    // "Adversários do Capítulo"
  static const String audioRegras =           "audio/screenTitles/regras_PT_female.mp3";       // "Regras do Jogo"

  static const String audioFight =            "audio/screenTitles/lutar_PT_female.mp3";        // "Lutar"

  static const String audioHeroes =        "audio/screenTitles/herois_PT_female.mp3";          // "Todos os heróis"
  static const String audioMyHeroes =      "audio/screenTitles/meusherois_PT_female.mp3";      // "Os meus Heróis"
  static const String audioMyRelics =      "audio/screenTitles/minhasreliquias_PT_female.mp3"; // "as minhas relíquias"
  static const String audioOtherItems =    "audio/screenTitles/outros_itens_PT_female.mp3";    // "outros itens"

  static const String audioHeroStats =     "audio/screenTitles/estatisticas.mp3";              // "Estatísticas de "
  static const String audioHeroMoreStats = "audio/screenTitles/mais_stats.mp3";                // "Mais Estatísticas de "
  static const String audioHeroHistory =   "audio/screenTitles/historia.mp3";                  // "História de "
  static const String audioEquipRelic =    "audio/screenTitles/equipar.mp3";                   // "Equipar Relíquia"
  static const String audioMergeHero =     "audio/screenTitles/fundir.mp3";                    // "Fundir"
  static const String audioSpecialPower =  "audio/screenTitles/poder_especial.mp3";            // "Poder Especial de"


  static const String audioAudio =         "audio/audio.mp3";
  static const String audioAccount =       "audio/vincular.mp3";
  static const String audioTutorials =     "audio/tutoriais.mp3";
  static const String audioQuestions =     "audio/perguntas.mp3";

  static const String audioVolumeVoice =   "audio/alterar_volume_voz.mp3";
  static const String audioVolumeSounds =  "audio/alterar_volume_som.mp3";
  static const String audioSpeedVoice =    "audio/alterar_velocidade_voz.mp3";
  static const String audioLanguage =      "audio/idioma.mp3";
  static const String audioDeactivateVibration =  "audio/deactivate_v.mp3";
  static const String audioActivateVibration =    "audio/activate_v.mp3";

  static const String audioIncreased =     "audio/aumentado.mp3";
  static const String audioDecreased =     "audio/diminuido.mp3";
  static const String audioIncreaseVoice = "audio/aumentar_volume_voz.mp3";
  static const String audioDecreaseVoice = "audio/diminuir_volume_voz.mp3";
  static const String audioIncreaseSound = "audio/aumentar_volume_som.mp3";
  static const String audioDecreaseSound = "audio/diminuir_volume_som.mp3";
  static const String audioIncreaseSpeed = "audio/aumentar_velocidade_voz.mp3";
  static const String audioDecreaseSpeed = "audio/diminuir_velocidade_voz.mp3";
  static const String audioVibrationDeactivated = "audio/v_deactivated.mp3";
  static const String audioVibrationActivated =   "audio/v_activated.mp3";


  static const List<String> audioTier = [
    "",
    "audio/stats/comum.mp3",
    "audio/stats/alta.mp3",
    "audio/stats/elevada.mp3",
  ];
  static const Map<String, String> audioHeroType = {
    DBConstants.typeDefense: "audio/stats/defense.mp3",
    DBConstants.typeOffense: "audio/stats/offense.mp3",
  };
  static const List<String> audioLevel = [
    "",
    "audio/stats/nivel1.mp3",
    "audio/stats/nivel2.mp3",
    "audio/stats/nivel3.mp3",
  ];
  static const List<String> audioForce = [
    "",
    "audio/stats/1forca.mp3",
    "audio/stats/2forca.mp3",
    "audio/stats/3forca.mp3",
    "audio/stats/4forca.mp3",
    "audio/stats/5forca.mp3"];
  static const List<String> audioLife = [
    "",
    "audio/stats/1vida.mp3",
    "audio/stats/2vida.mp3",
    "audio/stats/3vida.mp3",
    "audio/stats/4vida.mp3",
    "audio/stats/5vida.mp3"];
  static const List<String> audioPosition = [
    "",
    "audio/stats/1posicao.mp3",
    "audio/stats/2posicao.mp3",
    "audio/stats/3posicao.mp3",
    "audio/stats/4posicao.mp3"];
  static const List<String> audioChapter = [
    "",
    "audio/stats/c1p1.mp3",
    "audio/stats/c1p2.mp3",
    "audio/stats/c1p3.mp3"];


  static const List<String> audioNumbers = [
    "audio/numbers/0.mp3",
    "audio/numbers/1.mp3",
    "audio/numbers/2.mp3",
    "audio/numbers/3.mp3",
    "audio/numbers/4.mp3",
    "audio/numbers/5.mp3",
    "audio/numbers/6.mp3",
    "audio/numbers/7.mp3",
    "audio/numbers/8.mp3",
    "audio/numbers/9.mp3"];



  // -------------------------------- COLORS -----------------------------------

  static const Color fireColor =     Colors.redAccent;
  static const Color airColor =      Color.fromRGBO(255, 240, 105, 1);
  static const Color waterColor =    Colors.blueAccent;
  static const Color earthColor =    Colors.greenAccent;

  // static const Color screenColor1 =  Color.fromRGBO(104, 124, 148, 1);
  static const Color screenColor1 =  Color.fromRGBO(115, 123, 155, 1);
  static const Color screenColor2 =  Color.fromRGBO(255, 200, 100, 1);
  static const Color screenColor3 =  Color.fromRGBO(255, 131,  93, 1);
  static const Color screenColor4 =  Color.fromRGBO(120, 230, 255, 1);
  static const Color noScreenColor = Color.fromRGBO(0, 0, 0, 0);

  static const Color increaseColor = Color.fromRGBO(255, 100, 100, 1);
  static const Color decreaseColor = Color.fromRGBO(100, 100, 255, 1);


  static const Map<bool, Color> resultColors = {
    true: Color.fromRGBO(255, 200, 100, 1),
    false: Color.fromRGBO(60, 0, 100, 1)};


  // -------------------------------- IMAGES -----------------------------------

  static const String loadingScreenImageSrc =     "assets/image/loadingscreen.png";
  static const String comingSoonScreenImageSrc =  "assets/image/noimage.png";
  static const String galaxyImage1 =              "assets/image/noimage.png";
  static const String galaxyImage1Inv =           "assets/image/noimage.png";
  static const String galaxyImage2 =              "assets/image/noimage.png";
  static const String galaxyImage2Inv =           "assets/image/noimage.png";
  static const String galaxyImage3 =              "assets/image/noimage.png";
  static const String galaxyImage3Inv =           "assets/image/noimage.png";

  static const String galaxyImageShine =          "assets/image/noimage.png";
  static const String imageShine =                "assets/image/noimage.png";


  static const String victoryImageScr =          "assets/image/noimage.png";
  static const String defeatedImageScr =         "assets/image/noimage.png";

  static const String playImageSrc =             "assets/image/noimage.png";
  static const String autoplayImageSrc =         "assets/image/noimage.png";

  static const Map<bool, String> resultImageSrcs = {true: victoryImageScr,
    false: defeatedImageScr};


  static const String rewardImageSrc =       "assets/image/noimage.png";
  static const String rewardScrollImageSrc = "assets/image/noimage.png";
  static const String rewardsFrameImageSrc = "assets/image/noimage.png";
  static const String faixaImageSrc =        "assets/image/noimage.png";
  static const String frameDefinitionsImageSrc = "assets/image/noimage.png";

  static const String heroLevelImageSrc =    "assets/image/noimage.png";
  static const String enemyLevelImageSrc =   "assets/image/noimage.png";
  static const String heroStatsImageSrc =    "assets/image/noimage.png";
  static const String enemyStatsImageSrc =   "assets/image/noimage.png";
  static const String heartStatsImageSrc =   "assets/image/noimage.png";

  static const String battleImageSrc =       "assets/image/noimage.png";
  static const String definitionImageSrc =   "assets/image/noimage.png";
  static const String storeImageSrc =        "assets/image/noimage.png";
  static const String bagImageSrc =          "assets/image/noimage.png";

  static const String heroImageSrc =        "assets/image/noimage.png";
  static const String enemyImageSrc =       "assets/image/noimage.png";
  static const String myHeroesImageSrc =    "assets/image/noimage.png";
  static const String allHeroesImageSrc =   "assets/image/noimage.png";
  static const String rulesImageSrc =       "assets/image/noimage.png";
  static const String fightImageSrc =       "assets/image/noimage.png";

  static const String noHeroImageSrc =      "assets/image/noimage.png";
  static const String levelImageSrc =       "assets/image/noimage.png";

  static const String gemImageScr =         "assets/image/noimage.png";
  static const String fusionImageScr =      "assets/image/noimage.png";
  static const String expImageScr =         "assets/image/noimage.png";
  static const String chaliceIconImageScr = "assets/image/noimage.png";

  static const String historyImageSrc =     "assets/image/noimage.png";
  static const String mergeImageScr =       "assets/image/noimage.png";

  static const String increaseButton =       "assets/image/noimage.png";
  static const String decreaseButton =       "assets/image/noimage.png";

  static const List<String> numbersImage = [
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png"];

  static const List<String> negativeNumbersImage = [
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png",
    "assets/image/noimage.png"];


  // --------------------------------- ELEMENTS --------------------------------

  static const String audioAir =   "audio/air.mp3";    // "Elemento água"
  static const String audioWater = "audio/water.mp3";  // "Elemento ar"
  static const String audioFire =  "audio/fire.mp3";   // "Elemento fogo"
  static const String audioEarth = "audio/earth.mp3";  // "Elemento terra"
  static const Map <Elements, String> audioElements = {
    Elements.AIR:   audioAir,
    Elements.WATER: audioWater,
    Elements.FIRE:  audioFire,
    Elements.EARTH: audioEarth};

  static const Map <Elements, String> elementsImageSrcs = {
    Elements.AIR:   "assets/image/noimage.png",
    Elements.FIRE:  "assets/image/noimage.png",
    Elements.EARTH: "assets/image/noimage.png",
    Elements.WATER: "assets/image/noimage.png",
  };
  static const Map <Elements, String> elementsBgImageSrcs = {
    Elements.AIR:   "assets/image/noimage.png",
    Elements.FIRE:  "assets/image/noimage.png",
    Elements.EARTH: "assets/image/noimage.png",
    Elements.WATER: "assets/image/noimage.png",
  };
  static const Map <String, Elements> elementsName = {
    "Air":   Elements.AIR,
    "Fire":  Elements.FIRE,
    "Earth": Elements.EARTH,
    "Water": Elements.WATER,
  };
  static const Map <Elements, String> elementsStr = {
    Elements.AIR:   "Air",
    Elements.FIRE:  "Fire",
    Elements.EARTH: "Earth",
    Elements.WATER: "Water",
  };
  static const Map <Elements, Color> elementsColor = {
    Elements.AIR:   airColor,
    Elements.FIRE:  fireColor,
    Elements.EARTH: earthColor,
    Elements.WATER: waterColor,
  };
  static const Map <Elements, String> elementsAudio = {
    Elements.AIR:   audioAir,
    Elements.FIRE:  audioFire,
    Elements.EARTH: audioEarth,
    Elements.WATER: audioWater,
  };


  // -------------------------------- HEROES -----------------------------------

  static const Map <String, Heroes> heroesName = {
    DBConstants.amaterasu:      Heroes.AMATERASU,
    DBConstants.anubis:         Heroes.ANUBIS,
    DBConstants.adaLovelace:    Heroes.ADA_LOVELACE,
    DBConstants.wrightBrothers: Heroes.WRIGHT_BROTHERS,
    DBConstants.afrodite:       Heroes.AFRODITE,
    DBConstants.dionisio:       Heroes.DIONISIO,
    DBConstants.durga:          Heroes.DURGA,
    DBConstants.euterpe:        Heroes.EUTERPE,
    DBConstants.elfo:           Heroes.ELFO,
    DBConstants.fenix:          Heroes.FENIX,
    DBConstants.hathor:         Heroes.HATHOR,
    DBConstants.hades:          Heroes.HADES,
    DBConstants.kaulu:          Heroes.KAULU,
    DBConstants.loki:           Heroes.LOKI,
    DBConstants.longMu:         Heroes.LONG_MU,
    DBConstants.marieCurie:     Heroes.MARIE_CURIE,
    DBConstants.maui:           Heroes.MAUI,
    DBConstants.nagaKanya:      Heroes.NAGA_KANYA,
    DBConstants.poseidon:       Heroes.POSEIDON,
    DBConstants.pele:           Heroes.PELE,
    DBConstants.sunWukong:      Heroes.SUN_WUKONG,
    DBConstants.thalia:         Heroes.THALIA,
    DBConstants.tsukuyomi:      Heroes.TSUKUYOMI,
    DBConstants.valkiria:       Heroes.VALKIRIA};

  static const Map <Heroes, String> heroesImageSrcs = {
    Heroes.AMATERASU:       "assets/image/noimage.png",
    Heroes.ANUBIS:          "assets/image/noimage.png",
    Heroes.ADA_LOVELACE:    "assets/image/noimage.png",
    Heroes.WRIGHT_BROTHERS: "assets/image/noimage.png",
    Heroes.AFRODITE:        "assets/image/noimage.png",
    Heroes.DIONISIO:        "assets/image/noimage.png",
    Heroes.DURGA:           "assets/image/noimage.png",
    Heroes.EUTERPE:         "assets/image/noimage.png",
    Heroes.ELFO:            "assets/image/noimage.png",
    Heroes.FENIX:           "assets/image/noimage.png",
    Heroes.HATHOR:          "assets/image/noimage.png",
    Heroes.HADES:           "assets/image/noimage.png",
    Heroes.KAULU:           "assets/image/noimage.png",
    Heroes.LOKI:            "assets/image/noimage.png",
    Heroes.LONG_MU:         "assets/image/noimage.png",
    Heroes.MARIE_CURIE:     "assets/image/noimage.png",
    Heroes.MAUI:            "assets/image/noimage.png",
    Heroes.NAGA_KANYA:      "assets/image/noimage.png",
    Heroes.POSEIDON:        "assets/image/noimage.png",
    Heroes.PELE:            "assets/image/noimage.png",
    Heroes.SUN_WUKONG:      "assets/image/noimage.png",
    Heroes.THALIA:          "assets/image/noimage.png",
    Heroes.TSUKUYOMI:       "assets/image/noimage.png",
    Heroes.VALKIRIA:        "assets/image/noimage.png"};
  static const Map <Heroes, String> heroesImageSrcInverted = {
    Heroes.AMATERASU:       "assets/image/noimage.png",
    Heroes.ANUBIS:          "assets/image/noimage.png",
    Heroes.ADA_LOVELACE:    "assets/image/noimage.png",
    Heroes.WRIGHT_BROTHERS: "assets/image/noimage.png",
    Heroes.AFRODITE:        "assets/image/noimage.png",
    Heroes.DIONISIO:        "assets/image/noimage.png",
    Heroes.DURGA:           "assets/image/noimage.png",
    Heroes.EUTERPE:         "assets/image/noimage.png",
    Heroes.ELFO:            "assets/image/noimage.png",
    Heroes.FENIX:           "assets/image/noimage.png",
    Heroes.HATHOR:          "assets/image/noimage.png",
    Heroes.HADES:           "assets/image/noimage.png",
    Heroes.KAULU:           "assets/image/noimage.png",
    Heroes.LOKI:            "assets/image/noimage.png",
    Heroes.LONG_MU:         "assets/image/noimage.png",
    Heroes.MARIE_CURIE:     "assets/image/noimage.png",
    Heroes.MAUI:            "assets/image/noimage.png",
    Heroes.NAGA_KANYA:      "assets/image/noimage.png",
    Heroes.POSEIDON:        "assets/image/noimage.png",
    Heroes.PELE:            "assets/image/noimage.png",
    Heroes.SUN_WUKONG:      "assets/image/noimage.png",
    Heroes.THALIA:          "assets/image/noimage.png",
    Heroes.TSUKUYOMI:       "assets/image/noimage.png",
    Heroes.VALKIRIA:        "assets/image/noimage.png"};

  static const Map <Heroes, String> heroesAudio = {
    Heroes.AMATERASU:       "audio/heroes/amaterasu_PT_female.mp3",
    Heroes.ANUBIS:          "audio/heroes/anubis_PT_female.mp3",
    Heroes.ADA_LOVELACE:    "audio/heroes/adalovelace_EN_female.mp3",
    Heroes.WRIGHT_BROTHERS: "audio/heroes/wrightbrothers_PT_female.mp3",
    Heroes.AFRODITE:        "audio/heroes/afrodite_PT_female.mp3",
    Heroes.DIONISIO:        "audio/heroes/dionisio_PT_female.mp3",
    Heroes.DURGA:           "audio/heroes/durga_PT_female.mp3",
    Heroes.EUTERPE:         "audio/heroes/euterpe_PT_female.mp3",
    Heroes.ELFO:            "audio/heroes/elfo_PT_female.mp3",
    Heroes.FENIX:           "audio/heroes/fenix_PT_female.mp3",
    Heroes.HATHOR:          "audio/heroes/hathor_PT_female.mp3",
    Heroes.HADES:           "audio/heroes/hades_PT_female.mp3",
    Heroes.KAULU:           "audio/heroes/kaulu_PT_female.mp3",
    Heroes.LOKI:            "audio/heroes/loki_PT_female.mp3",
    Heroes.LONG_MU:         "audio/heroes/longmu_PT_female.mp3",
    Heroes.MARIE_CURIE:     "audio/heroes/mariecurie_PT_female.mp3",
    Heroes.MAUI:            "audio/heroes/maui_PT_female.mp3",
    Heroes.NAGA_KANYA:      "audio/heroes/nagakanya_PT_female.mp3",
    Heroes.POSEIDON:        "audio/heroes/poseidon_PT_female.mp3",
    Heroes.PELE:            "audio/heroes/pele_PT_female.mp3",
    Heroes.SUN_WUKONG:      "audio/heroes/sunwukong_PT_female.mp3",
    Heroes.THALIA:          "audio/heroes/thalia_PT_female.mp3",
    Heroes.TSUKUYOMI:       "audio/heroes/tsukuyomi_PT_female.mp3",
    Heroes.VALKIRIA:        "audio/heroes/valkiria_PT_female.mp3"};
  static const Map <Heroes, String> heroesAudioPhrases = {
    Heroes.AMATERASU:       "audio/heroes/phrase/amaterasu_phrase.mp3",
    Heroes.ANUBIS:          "audio/heroes/phrase/anubis_phrase.mp3",
    Heroes.ADA_LOVELACE:    "audio/heroes/phrase/adalovelace_phrase.mp3",
    Heroes.WRIGHT_BROTHERS: "audio/heroes/phrase/wrightbrothers_phrase.mp3",
    Heroes.AFRODITE:        "audio/heroes/phrase/afrodite_phrase.mp3",
    Heroes.DIONISIO:        "audio/heroes/phrase/dionisio_phrase.mp3",
    Heroes.DURGA:           "audio/heroes/phrase/durga_phrase.mp3",
    Heroes.EUTERPE:         "audio/heroes/phrase/euterpe_phrase.mp3",
    Heroes.ELFO:            "audio/heroes/phrase/elfo_phrase.mp3",
    Heroes.FENIX:           "audio/heroes/phrase/fenix_phrase.mp3",
    Heroes.HATHOR:          "audio/heroes/phrase/hathor_phrase.mp3",
    Heroes.HADES:           "audio/heroes/phrase/hades_phrase.mp3",
    Heroes.KAULU:           "audio/heroes/phrase/kaulu_phrase.mp3",
    Heroes.LOKI:            "audio/heroes/phrase/loki_phrase.mp3",
    Heroes.LONG_MU:         "audio/heroes/phrase/longmu_phrase.mp3",
    Heroes.MARIE_CURIE:     "audio/heroes/phrase/mariecurie_phrase.mp3",
    Heroes.MAUI:            "audio/heroes/phrase/maui_phrase.mp3",
    Heroes.NAGA_KANYA:      "audio/heroes/phrase/naga_phrase.mp3",
    Heroes.POSEIDON:        "audio/heroes/phrase/poseidon_phrase.mp3",
    Heroes.PELE:            "audio/heroes/phrase/pele_phrase.mp3",
    Heroes.SUN_WUKONG:      "audio/heroes/phrase/sunwukong_phrase.mp3",
    Heroes.THALIA:          "audio/heroes/phrase/thalia_phrase.mp3",
    Heroes.TSUKUYOMI:       "audio/heroes/phrase/tsukuyomi_phrase.mp3",
    Heroes.VALKIRIA:        "audio/heroes/phrase/valkiria_phrase.mp3"};


  // --------------------------------- RELICS ----------------------------------

  static const Map <String, Relics> relicsName = {
    DBConstants.chalice:  Relics.CHALICE,
    DBConstants.crown:    Relics.CROWN,
    DBConstants.flail:    Relics.FLAIL,
    DBConstants.mace:     Relics.MACE,
    DBConstants.necklace: Relics.NECKLACE,
    DBConstants.pan:      Relics.PAN,
    DBConstants.potion:   Relics.POTION,
    DBConstants.ring:     Relics.RING,
    DBConstants.shield:   Relics.SHIELD,
    DBConstants.sword:    Relics.SWORD};

  static const Map <Relics, String> relicsImageSrcs = {
    Relics.CHALICE:  "assets/image/noimage.png",
    Relics.CROWN:    "assets/image/noimage.png",
    Relics.FLAIL:    "assets/image/noimage.png",
    Relics.MACE:     "assets/image/noimage.png",
    Relics.NECKLACE: "assets/image/noimage.png",
    Relics.PAN:      "assets/image/noimage.png",
    Relics.POTION:   "assets/image/noimage.png",
    Relics.RING:     "assets/image/noimage.png",
    Relics.SHIELD:   "assets/image/noimage.png",
    Relics.SWORD:    "assets/image/noimage.png",
    Relics.DEFAULT_RELIC : ""};
  static const Map <Relics, String> relicsAudio = {
    Relics.CHALICE:  "audio/relics/chalice.mp3",
    Relics.CROWN:    "audio/relics/crown.mp3",
    Relics.FLAIL:    "audio/relics/crookflail.mp3",
    Relics.MACE:     "audio/relics/mace.mp3",
    Relics.NECKLACE: "audio/relics/necklace.mp3",
    Relics.PAN:      "audio/relics/pan.mp3",
    Relics.POTION:   "audio/relics/potion.mp3",
    Relics.RING:     "audio/relics/ring.mp3",
    Relics.SHIELD:   "audio/relics/shield.mp3",
    Relics.SWORD:    "audio/relics/sword.mp3"};


 // // -------------------------------- IMAGES -----------------------------------
 //
 //  static const String loadingScreenImageSrc =    "assets/image/loadingscreen.png";
 //  static const String comingSoonScreenImageSrc = "assets/image/comingSoon.png";
 //  static const String galaxyImage1 =              "assets/image/space1.png";
 //  static const String galaxyImage1Inv =           "assets/image/space1_inv.png";
 //  static const String galaxyImage2 =              "assets/image/space22.png";
 //  static const String galaxyImage2Inv =           "assets/image/space22_inv.png";
 //
 //  static const String galaxyImageShine =           "assets/image/space21.png";
 //  static const String imageShine =                 "assets/image/star.png";
 //
 //
 //  static const String victoryImageScr =          "assets/image/vencedor.png";
 //  static const String defeatedImageScr =         "assets/image/perdedor.png";
 //
 //  static const String playImageSrc =             "assets/image/play11.png";
 //  static const String autoplayImageSrc =         "assets/image/autoplay1.png";
 //
 //  static const Map<bool, String> resultImageSrcs = {true: victoryImageScr,
 //    false: defeatedImageScr};
 //
 //
 //  static const String rewardImageSrc =       "assets/image/main_page/bau.png";
 //  static const String rewardScrollImageSrc = "assets/image/rewards.png";
 //  static const String rewardsFrameImageSrc = "assets/image/frame1.png";
 //  static const String faixaImageSrc =        "assets/image/faixa.png";
 //  static const String frameDefinitionsImageSrc = "assets/image/definitions_frame.png";
 //
 //  static const String heroLevelImageSrc =    "assets/image/hero_level.png";
 //  static const String enemyLevelImageSrc =   "assets/image/enemy_level.png";
 //  static const String heroStatsImageSrc =    "assets/image/hero_stats.png";
 //  static const String enemyStatsImageSrc =   "assets/image/enemy_stats.png";
 //  static const String heartStatsImageSrc =   "assets/image/heart.png";
 //
 //  static const String battleImageSrc =       "assets/image/main_page/batalha.png";
 //  static const String definitionImageSrc =   "assets/image/main_page/definicoes1.png";
 //  static const String storeImageSrc =        "assets/image/main_page/loja.png";
 //  static const String bagImageSrc =          "assets/image/main_page/bolsa.png";
 //
 //  static const String heroImageSrc =        "assets/image/heroes/amaterasu.png";
 //  static const String enemyImageSrc =       "assets/image/heroes/dionisio.png";
 //  static const String myHeroesImageSrc =    "assets/image/heroes/thalia_inv.png";
 //  static const String allHeroesImageSrc =   "assets/image/heroes/sunwukong_inv.png";
 //  static const String rulesImageSrc =       "assets/image/battle_page/book.png";
 //  static const String fightImageSrc =       "assets/image/battle_page/combate.png";
 //
 //  static const String noHeroImageSrc =      "assets/image/nohero.png";
 //  static const String levelImageSrc =       "assets/image/nivelframe.png";
 //
 //  static const String gemImageScr =         "assets/image/gems.png";
 //  static const String fusionImageScr =      "assets/image/fusion.png";
 //  static const String expImageScr =         "assets/image/exp.png";
 //  static const String chaliceIconImageScr = "assets/image/relics/chaliceicon.png";
 //
 //  static const String historyImageSrc =     "assets/image/history_scroll.png";
 //  static const String mergeImageScr =       "assets/image/merge.png";
 //
 //  static const String increaseButton =       "assets/image/increase.png";
 //  static const String decreaseButton =       "assets/image/decrease.png";
 //
 //  static const List<String> numbersImage = [
 //    "assets/image/number/zero.png",
 //    "assets/image/number/one.png",
 //    "assets/image/number/two.png",
 //    "assets/image/number/three.png",
 //    "assets/image/number/four.png",
 //    "assets/image/number/five.png",
 //    "assets/image/number/six.png",
 //    "assets/image/number/seven.png",
 //    "assets/image/number/eight.png",
 //    "assets/image/number/nine.png"];
 //
 //  static const List<String> negativeNumbersImage = [
 //    "assets/image/number/m_zero.png",
 //    "assets/image/number/m_one.png",
 //    "assets/image/number/m_two.png",
 //    "assets/image/number/m_three.png",
 //    "assets/image/number/m_four.png",
 //    "assets/image/number/m_five.png",
 //    "assets/image/number/m_six.png",
 //    "assets/image/number/m_seven.png",
 //    "assets/image/number/m_eight.png",
 //    "assets/image/number/m_nine.png"];
 //
 //
 //  // --------------------------------- ELEMENTS --------------------------------
 //
 //  static const String audioAir =   "audio/air.mp3";    // "Elemento água"
 //  static const String audioWater = "audio/water.mp3";  // "Elemento ar"
 //  static const String audioFire =  "audio/fire.mp3";   // "Elemento fogo"
 //  static const String audioEarth = "audio/earth.mp3";  // "Elemento terra"
 //  static const Map <Elements, String> audioElements = {
 //    Elements.AIR:   audioAir,
 //    Elements.WATER: audioWater,
 //    Elements.FIRE:  audioFire,
 //    Elements.EARTH: audioEarth};
 //
 //  static const Map <Elements, String> elementsImageSrcs = {
 //    Elements.AIR:   "assets/image/air_symbol.png",
 //    Elements.FIRE:  "assets/image/fire_symbol.png",
 //    Elements.EARTH: "assets/image/earth_symbol.png",
 //    Elements.WATER: "assets/image/water_symbol.png",
 //  };
 //  static const Map <Elements, String> elementsBgImageSrcs = {
 //    Elements.AIR:   "assets/image/air_bg.jpg",
 //    Elements.FIRE:  "assets/image/fire_bg.jpg",
 //    Elements.EARTH: "assets/image/earth_bg.jpg",
 //    Elements.WATER: "assets/image/water_bg.jpg",
 //  };
 //  static const Map <String, Elements> elementsName = {
 //    "Air":   Elements.AIR,
 //    "Fire":  Elements.FIRE,
 //    "Earth": Elements.EARTH,
 //    "Water": Elements.WATER,
 //  };
 //  static const Map <Elements, String> elementsStr = {
 //    Elements.AIR:   "Air",
 //    Elements.FIRE:  "Fire",
 //    Elements.EARTH: "Earth",
 //    Elements.WATER: "Water",
 //  };
 //  static const Map <Elements, Color> elementsColor = {
 //    Elements.AIR:   airColor,
 //    Elements.FIRE:  fireColor,
 //    Elements.EARTH: earthColor,
 //    Elements.WATER: waterColor,
 //  };
 //  static const Map <Elements, String> elementsAudio = {
 //    Elements.AIR:   audioAir,
 //    Elements.FIRE:  audioFire,
 //    Elements.EARTH: audioEarth,
 //    Elements.WATER: audioWater,
 //  };
 //
 //
 //  // -------------------------------- HEROES -----------------------------------
 //
 //  static const Map <String, Heroes> heroesName = {
 //    DBConstants.amaterasu:      Heroes.AMATERASU,
 //    DBConstants.anubis:         Heroes.ANUBIS,
 //    DBConstants.adaLovelace:    Heroes.ADA_LOVELACE,
 //    DBConstants.wrightBrothers: Heroes.WRIGHT_BROTHERS,
 //    DBConstants.afrodite:       Heroes.AFRODITE,
 //    DBConstants.dionisio:       Heroes.DIONISIO,
 //    DBConstants.durga:          Heroes.DURGA,
 //    DBConstants.euterpe:        Heroes.EUTERPE,
 //    DBConstants.elfo:           Heroes.ELFO,
 //    DBConstants.fenix:          Heroes.FENIX,
 //    DBConstants.hathor:         Heroes.HATHOR,
 //    DBConstants.hades:          Heroes.HADES,
 //    DBConstants.kaulu:          Heroes.KAULU,
 //    DBConstants.loki:           Heroes.LOKI,
 //    DBConstants.longMu:         Heroes.LONG_MU,
 //    DBConstants.marieCurie:     Heroes.MARIE_CURIE,
 //    DBConstants.maui:           Heroes.MAUI,
 //    DBConstants.nagaKanya:      Heroes.NAGA_KANYA,
 //    DBConstants.poseidon:       Heroes.POSEIDON,
 //    DBConstants.pele:           Heroes.PELE,
 //    DBConstants.sunWukong:      Heroes.SUN_WUKONG,
 //    DBConstants.thalia:         Heroes.THALIA,
 //    DBConstants.tsukuyomi:      Heroes.TSUKUYOMI,
 //    DBConstants.valkiria:       Heroes.VALKIRIA};
 //
 //  static const Map <Heroes, String> heroesImageSrcs = {
 //    Heroes.AMATERASU:       "assets/image/heroes/amaterasu.png",
 //    Heroes.ANUBIS:          "assets/image/heroes/anubis.png",
 //    Heroes.ADA_LOVELACE:    "assets/image/heroes/adalovelace.png",
 //    Heroes.WRIGHT_BROTHERS: "assets/image/heroes/wrightbrothers.png",
 //    Heroes.AFRODITE:        "assets/image/heroes/afrodite.png",
 //    Heroes.DIONISIO:        "assets/image/heroes/dionisio.png",
 //    Heroes.DURGA:           "assets/image/heroes/durga.png",
 //    Heroes.EUTERPE:         "assets/image/heroes/euterpe.png",
 //    Heroes.ELFO:            "assets/image/heroes/elfo.png",
 //    Heroes.FENIX:           "assets/image/heroes/fenix.png",
 //    Heroes.HATHOR:          "assets/image/heroes/hathor.png",
 //    Heroes.HADES:           "assets/image/heroes/hades.png",
 //    Heroes.KAULU:           "assets/image/heroes/kaulu.png",
 //    Heroes.LOKI:            "assets/image/heroes/loki.png",
 //    Heroes.LONG_MU:         "assets/image/heroes/longmu.png",
 //    Heroes.MARIE_CURIE:     "assets/image/heroes/mariecurie.png",
 //    Heroes.MAUI:            "assets/image/heroes/maui.png",
 //    Heroes.NAGA_KANYA:      "assets/image/heroes/nagakanya.png",
 //    Heroes.POSEIDON:        "assets/image/heroes/poseidon.png",
 //    Heroes.PELE:            "assets/image/heroes/pele.png",
 //    Heroes.SUN_WUKONG:      "assets/image/heroes/sunwukong.png",
 //    Heroes.THALIA:          "assets/image/heroes/thalia.png",
 //    Heroes.TSUKUYOMI:       "assets/image/heroes/tsukuyomi.png",
 //    Heroes.VALKIRIA:        "assets/image/heroes/valkiria.png"};
 //  static const Map <Heroes, String> heroesImageSrcInverted = {
 //    Heroes.AMATERASU:       "assets/image/heroes/amaterasu_inv.png",
 //    Heroes.ANUBIS:          "assets/image/heroes/anubis_inv.png",
 //    Heroes.ADA_LOVELACE:    "assets/image/heroes/adalovelace_inv.png",
 //    Heroes.WRIGHT_BROTHERS: "assets/image/heroes/wrightbrothers_inv.png",
 //    Heroes.AFRODITE:        "assets/image/heroes/afrodite_inv.png",
 //    Heroes.DIONISIO:        "assets/image/heroes/dionisio_inv.png",
 //    Heroes.DURGA:           "assets/image/heroes/durga_inv.png",
 //    Heroes.EUTERPE:         "assets/image/heroes/euterpe_inv.png",
 //    Heroes.ELFO:            "assets/image/heroes/elfo_inv.png",
 //    Heroes.FENIX:           "assets/image/heroes/fenix_inv.png",
 //    Heroes.HATHOR:          "assets/image/heroes/hathor_inv.png",
 //    Heroes.HADES:           "assets/image/heroes/hades_inv.png",
 //    Heroes.KAULU:           "assets/image/heroes/kaulu_inv.png",
 //    Heroes.LOKI:            "assets/image/heroes/loki_inv.png",
 //    Heroes.LONG_MU:         "assets/image/heroes/longmu_inv.png",
 //    Heroes.MARIE_CURIE:     "assets/image/heroes/mariecurie_inv.png",
 //    Heroes.MAUI:            "assets/image/heroes/maui_inv.png",
 //    Heroes.NAGA_KANYA:      "assets/image/heroes/nagakanya_inv.png",
 //    Heroes.POSEIDON:        "assets/image/heroes/poseidon_inv.png",
 //    Heroes.PELE:            "assets/image/heroes/pele_inv.png",
 //    Heroes.SUN_WUKONG:      "assets/image/heroes/sunwukong_inv.png",
 //    Heroes.THALIA:          "assets/image/heroes/thalia_inv.png",
 //    Heroes.TSUKUYOMI:       "assets/image/heroes/tsukuyomi_inv.png",
 //    Heroes.VALKIRIA:        "assets/image/heroes/valkiria_inv.png"};
 //
 //  static const Map <Heroes, String> heroesAudio = {
 //    Heroes.AMATERASU:       "audio/heroes/amaterasu_PT_female.mp3",
 //    Heroes.ANUBIS:          "audio/heroes/anubis_PT_female.mp3",
 //    Heroes.ADA_LOVELACE:    "audio/heroes/adalovelace_EN_female.mp3",
 //    Heroes.WRIGHT_BROTHERS: "audio/heroes/wrightbrothers_PT_female.mp3",
 //    Heroes.AFRODITE:        "audio/heroes/afrodite_PT_female.mp3",
 //    Heroes.DIONISIO:        "audio/heroes/dionisio_PT_female.mp3",
 //    Heroes.DURGA:           "audio/heroes/durga_PT_female.mp3",
 //    Heroes.EUTERPE:         "audio/heroes/euterpe_PT_female.mp3",
 //    Heroes.ELFO:            "audio/heroes/elfo_PT_female.mp3",
 //    Heroes.FENIX:           "audio/heroes/fenix_PT_female.mp3",
 //    Heroes.HATHOR:          "audio/heroes/hathor_PT_female.mp3",
 //    Heroes.HADES:           "audio/heroes/hades_PT_female.mp3",
 //    Heroes.KAULU:           "audio/heroes/kaulu_PT_female.mp3",
 //    Heroes.LOKI:            "audio/heroes/loki_PT_female.mp3",
 //    Heroes.LONG_MU:         "audio/heroes/longmu_PT_female.mp3",
 //    Heroes.MARIE_CURIE:     "audio/heroes/mariecurie_PT_female.mp3",
 //    Heroes.MAUI:            "audio/heroes/maui_PT_female.mp3",
 //    Heroes.NAGA_KANYA:      "audio/heroes/nagakanya_PT_female.mp3",
 //    Heroes.POSEIDON:        "audio/heroes/poseidon_PT_female.mp3",
 //    Heroes.PELE:            "audio/heroes/pele_PT_female.mp3",
 //    Heroes.SUN_WUKONG:      "audio/heroes/sunwukong_PT_female.mp3",
 //    Heroes.THALIA:          "audio/heroes/thalia_PT_female.mp3",
 //    Heroes.TSUKUYOMI:       "audio/heroes/tsukuyomi_PT_female.mp3",
 //    Heroes.VALKIRIA:        "audio/heroes/valkiria_PT_female.mp3"};
 //  static const Map <Heroes, String> heroesAudioPhrases = {
 //    Heroes.AMATERASU:       "audio/heroes/phrase/amaterasu_phrase.mp3",
 //    Heroes.ANUBIS:          "audio/heroes/phrase/anubis_phrase.mp3",
 //    Heroes.ADA_LOVELACE:    "audio/heroes/phrase/adalovelace_phrase.mp3",
 //    Heroes.WRIGHT_BROTHERS: "audio/heroes/phrase/wrightbrothers_phrase.mp3",
 //    Heroes.AFRODITE:        "audio/heroes/phrase/afrodite_phrase.mp3",
 //    Heroes.DIONISIO:        "audio/heroes/phrase/dionisio_phrase.mp3",
 //    Heroes.DURGA:           "audio/heroes/phrase/durga_phrase.mp3",
 //    Heroes.EUTERPE:         "audio/heroes/phrase/euterpe_phrase.mp3",
 //    Heroes.ELFO:            "audio/heroes/phrase/elfo_phrase.mp3",
 //    Heroes.FENIX:           "audio/heroes/phrase/fenix_phrase.mp3",
 //    Heroes.HATHOR:          "audio/heroes/phrase/hathor_phrase.mp3",
 //    Heroes.HADES:           "audio/heroes/phrase/hades_phrase.mp3",
 //    Heroes.KAULU:           "audio/heroes/phrase/kaulu_phrase.mp3",
 //    Heroes.LOKI:            "audio/heroes/phrase/loki_phrase.mp3",
 //    Heroes.LONG_MU:         "audio/heroes/phrase/longmu_phrase.mp3",
 //    Heroes.MARIE_CURIE:     "audio/heroes/phrase/mariecurie_phrase.mp3",
 //    Heroes.MAUI:            "audio/heroes/phrase/maui_phrase.mp3",
 //    Heroes.NAGA_KANYA:      "audio/heroes/phrase/naga_phrase.mp3",
 //    Heroes.POSEIDON:        "audio/heroes/phrase/poseidon_phrase.mp3",
 //    Heroes.PELE:            "audio/heroes/phrase/pele_phrase.mp3",
 //    Heroes.SUN_WUKONG:      "audio/heroes/phrase/sunwukong_phrase.mp3",
 //    Heroes.THALIA:          "audio/heroes/phrase/thalia_phrase.mp3",
 //    Heroes.TSUKUYOMI:       "audio/heroes/phrase/tsukuyomi_phrase.mp3",
 //    Heroes.VALKIRIA:        "audio/heroes/phrase/valkiria_phrase.mp3"};
 //
 //
 //  // --------------------------------- RELICS ----------------------------------
 //
 //  static const Map <String, Relics> relicsName = {
 //    DBConstants.chalice:  Relics.CHALICE,
 //    DBConstants.crown:    Relics.CROWN,
 //    DBConstants.flail:    Relics.FLAIL,
 //    DBConstants.mace:     Relics.MACE,
 //    DBConstants.necklace: Relics.NECKLACE,
 //    DBConstants.pan:      Relics.PAN,
 //    DBConstants.potion:   Relics.POTION,
 //    DBConstants.ring:     Relics.RING,
 //    DBConstants.shield:   Relics.SHIELD,
 //    DBConstants.sword:    Relics.SWORD};
 //
 //  static const Map <Relics, String> relicsImageSrcs = {
 //    Relics.CHALICE:  "assets/image/relics/chalice.png",
 //    Relics.CROWN:    "assets/image/relics/crown.png",
 //    Relics.FLAIL:    "assets/image/relics/crookflail.png",
 //    Relics.MACE:     "assets/image/relics/mace.png",
 //    Relics.NECKLACE: "assets/image/relics/necklace.png",
 //    Relics.PAN:      "assets/image/relics/pan.png",
 //    Relics.POTION:   "assets/image/relics/potion.png",
 //    Relics.RING:     "assets/image/relics/ring.png",
 //    Relics.SHIELD:   "assets/image/relics/shield.png",
 //    Relics.SWORD:    "assets/image/relics/sword.png",
 //    Relics.DEFAULT_RELIC : ""};
 //  static const Map <Relics, String> relicsAudio = {
 //    Relics.CHALICE:  "audio/relics/chalice.mp3",
 //    Relics.CROWN:    "audio/relics/crown.mp3",
 //    Relics.FLAIL:    "audio/relics/crookflail.mp3",
 //    Relics.MACE:     "audio/relics/mace.mp3",
 //    Relics.NECKLACE: "audio/relics/necklace.mp3",
 //    Relics.PAN:      "audio/relics/pan.mp3",
 //    Relics.POTION:   "audio/relics/potion.mp3",
 //    Relics.RING:     "audio/relics/ring.mp3",
 //    Relics.SHIELD:   "audio/relics/shield.mp3",
 //    Relics.SWORD:    "audio/relics/sword.mp3"};
 //
 //
}