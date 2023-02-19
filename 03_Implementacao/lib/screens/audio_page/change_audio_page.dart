import 'dart:math';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/constants/assets_constants.dart';
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../audio.dart';
import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class ChangeAudioPage extends StatefulWidget {
  const ChangeAudioPage({Key? key}) : super(key: key);

  @override
  _ChangeAudioPageState createState() => _ChangeAudioPageState();

}

class _ChangeAudioPageState extends State<ChangeAudioPage> {

  @override
  Widget build(BuildContext context) {

    String changeAudioPageTitle = (ScreenConstants.changeAudioPage == AudioChange.VOICE) ?
    ScreenConstants.volumeVoicePageTitle : (ScreenConstants.changeAudioPage == AudioChange.SOUND) ?
    ScreenConstants.volumeSoundPageTitle : ScreenConstants.velocityPageTitle;

    String changeAudioPageAudio = (ScreenConstants.changeAudioPage == AudioChange.VOICE) ?
    AssetsConstants.audioVolumeVoice : (ScreenConstants.changeAudioPage == AudioChange.SOUND) ?
    AssetsConstants.audioVolumeSounds : AssetsConstants.audioSpeedVoice;

    Audio.waitingToPlay(
        [AssetsConstants.audioButton, changeAudioPageAudio], audioVoiceType: false, faster: 500);

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.CHANGE_AUDIO_PAGE, changeAudioPageTitle,
            specificAudio: changeAudioPageAudio),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ChangePage.toAudioPage(context);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  Column(
                    children: [
							        Row(
                        children: [
                          _addQuadrant(context, AssetsConstants.increaseButton,
                        AssetsConstants.increaseColor, true),
							        ],),
							        Row(
                        children: [
                          _addQuadrant(context, AssetsConstants.decreaseButton,
                        AssetsConstants.decreaseColor, false),
							],),],)],);
						},
					),
        )));
  }
  static _addQuadrant(context, String imageSrc, Color color, bool toIncrease) {

    String increase = (ScreenConstants.changeAudioPage == AudioChange.VOICE) ?
    AssetsConstants.audioIncreaseVoice : (ScreenConstants.changeAudioPage == AudioChange.SOUND) ?
    AssetsConstants.audioIncreaseSound : AssetsConstants.audioIncreaseSpeed;

    String decrease = (ScreenConstants.changeAudioPage == AudioChange.VOICE) ?
    AssetsConstants.audioDecreaseVoice : (ScreenConstants.changeAudioPage == AudioChange.SOUND) ?
    AssetsConstants.audioDecreaseSound : AssetsConstants.audioDecreaseSpeed;

    return InkWell(
        onTap: () => Audio.play(toIncrease? increase : decrease, audioVoiceType: true),
        onDoubleTap: () {
          if        (toIncrease &&  ScreenConstants.changeAudioPage == AudioChange.VOICE) {
            GameController.voiceVolume = min(1, GameController.voiceVolume + 0.2);
            // if (kDebugMode) print("voiceVolume: ${GameController.voiceVolume}");
          }
          else if (toIncrease &&  ScreenConstants.changeAudioPage == AudioChange.SOUND) {
            GameController.soundVolume = min(1, GameController.soundVolume + 0.2);
            // if (kDebugMode) print("soundVolume: ${GameController.soundVolume}");
          } else if (toIncrease &&  ScreenConstants.changeAudioPage == AudioChange.SPEED) {
            GameController.voiceSpeed = min(1.75, GameController.voiceSpeed + 0.25);
            // if (kDebugMode) print("voiceSpeed:  ${GameController.voiceSpeed}");
          } else if (!toIncrease && ScreenConstants.changeAudioPage == AudioChange.VOICE) {
            GameController.voiceVolume = max(0, GameController.voiceVolume - 0.2);
            // if (kDebugMode) print("voiceVolume: ${GameController.voiceVolume}");
          } else if (!toIncrease && ScreenConstants.changeAudioPage == AudioChange.SOUND) {
            GameController.soundVolume = max(0, GameController.soundVolume - 0.2);
            // if (kDebugMode) print("soundVolume: ${GameController.soundVolume}");
          } else if (!toIncrease && ScreenConstants.changeAudioPage == AudioChange.SPEED) {
            GameController.voiceSpeed = max(0.5, GameController.voiceSpeed - 0.25);
            if (kDebugMode) print("voiceSpeed:  ${GameController.voiceSpeed}");
          } else {
            if (kDebugMode) {
              print("Error with the change audio page setting!");
            }
          }
          GameController.setMuteVoice((GameController.voiceVolume == 0));
          GameController.setMuteSound((GameController.soundVolume == 0));

          if ((ScreenConstants.changeAudioPage == AudioChange.VOICE &&
                  (GameController.voiceVolume == 1   || GameController.voiceVolume == 0)) ||
              (ScreenConstants.changeAudioPage == AudioChange.SOUND &&
                  (GameController.soundVolume != 1   && GameController.soundVolume != 0)) ||
              (ScreenConstants.changeAudioPage == AudioChange.SPEED &&
                  (GameController.voiceSpeed == 1.75 || GameController.voiceSpeed == 0.5))) {
            Audio.play(AssetsConstants.audioButton, audioVoiceType: false);
          }
          else if ((ScreenConstants.changeAudioPage == AudioChange.SOUND &&
              (GameController.soundVolume == 1   || GameController.soundVolume == 0))) {
            Audio.play(AssetsConstants.audioIncreased, audioVoiceType: true);
          }
          else {
            Audio.play(
                toIncrease ? AssetsConstants.audioIncreased : AssetsConstants
                    .audioDecreased, audioVoiceType: true);
          }
        },
        child:
        Container(
          height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
          width: ScreenConstants.screenWidth,
          color: color,
          child:
          Stack(
            children: <Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Image(image: AssetImage(imageSrc),
                    height: (ScreenConstants.screenHeight / 4),),
                ],
              ),
            ],
          ),
        )
    );
  }
}