
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:mythical_battles_project_65/vibration.dart';

import 'constants/screen_constants.dart';
import 'constants/assets_constants.dart';
import 'game_controller.dart';

class Audio {

  static AudioPlayer player = AudioPlayer();

  static Timer timer = Timer(const Duration(milliseconds: 0), () {});

  static int id = 0;

  static const int fastAudioDuration = 1000;
  static int mediumAudioDuration = 1200 ~/ GameController.voiceSpeed;
  static const int bigAudioDuration = 2000;

  static playPlayer(String audioAsset, {required bool audioVoiceType, required bool isHeroPhrase}) async {

    player = AudioPlayer();
    player.setPlayerMode(PlayerMode.lowLatency);

    if (audioVoiceType && !isHeroPhrase){
      player.setVolume(GameController.getVoiceVolume());
      player.setPlaybackRate(GameController.getVoiceSpeed());
    }
    else if (isHeroPhrase){
      player.setVolume(GameController.getVoiceVolume());
      await player.setPlaybackRate(1);
    }
    else {
      await player.setVolume(GameController.getSoundVolume());
      await player.setPlaybackRate(1);
    }


    if (!(audioVoiceType && GameController.getMuteVoice()) ||
        !(!audioVoiceType && GameController.getMuteSound())) {
      await player.play(AssetSource(audioAsset));
    }
  }

  static stop() async {
    id = ++id % 32;
    player.stop();
    timer.cancel();
  }

  static play(String audioAsset, {required bool audioVoiceType, bool? isHeroPhrase}) {
    stop();
    if (audioVoiceType) {
      Vibration.lightVibration();
    }
    playPlayer(audioAsset, audioVoiceType: audioVoiceType, isHeroPhrase: isHeroPhrase ?? false);
  }

  static waitingToPlay(List<String> audioAssets, {required bool audioVoiceType,
    bool? isHeroPhrase, int? faster}) {
    stop();
    int currentId = id;
    int duration = faster ?? mediumAudioDuration;
    for (int i = 0; i < audioAssets.length; i++) {
      timer = Timer(Duration(milliseconds: (duration * i)), () {
        if (currentId == id) {
          playPlayer(audioAssets[i], audioVoiceType: audioVoiceType, isHeroPhrase: isHeroPhrase ?? false);
        }
      });
    }
  }

  static String getAudio(Screens screen) {
    switch(screen){
      case Screens.MAIN_PAGE:
        return AssetsConstants.audioMainPage;

      case Screens.BATTLE_PAGE:
        return AssetsConstants.audioBatalha;
      case Screens.DEFINITIONS_PAGE:
        return AssetsConstants.audioDefinicoes;
      case Screens.STORE_PAGE:
        return AssetsConstants.audioLoja;
      case Screens.BAG_PAGE:
        return AssetsConstants.audioBolsa;

      case Screens.SELECT_HEROES_PAGE:
        return AssetsConstants.audioSelecionarHeroes;
      case Screens.OPPONENTS_PAGE:
        return AssetsConstants.audioVerOponentes;
      case Screens.RULES_PAGE:
        return AssetsConstants.audioRegras;
      case Screens.FIGHT_PAGE:
        return AssetsConstants.audioFight;

      case Screens.CHOOSE_POSITION_PAGE:
        return AssetsConstants.audioEscolherPosicao;

      case Screens.MY_HEROES_PAGE:
        return AssetsConstants.audioMyHeroes;
      case Screens.HEROES_PAGE:
        return AssetsConstants.audioHeroes;
      case Screens.MY_RELICS_PAGE:
        return AssetsConstants.audioMyRelics;
      case Screens.OTHER_ITEMS_PAGE:
        return AssetsConstants.audioOtherItems;

      case Screens.EQUIP_PAGE:
        return AssetsConstants.audioEquipRelic;

      case Screens.TUTORIALS_PAGE:
        return AssetsConstants.audioTutorials;
      case Screens.LANGUAGE_PAGE:
        return AssetsConstants.audioLanguage;
      case Screens.ACCOUNT_PAGE:
        return AssetsConstants.audioAccount;
      case Screens.AUDIO_PAGE:
        return AssetsConstants.audioAudio;

      default:
        return AssetsConstants.audioComingSoon;
    }
  }
}