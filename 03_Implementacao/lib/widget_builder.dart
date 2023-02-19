
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/vibration.dart';

import 'database/database_reference.dart';
import 'audio.dart';
import 'change_page.dart';
import 'constants/assets_constants.dart';
import 'constants/db_constants.dart';
import 'constants/screen_constants.dart';
import 'database/hero.dart';
import 'database/relic.dart';
import 'game_controller.dart';


class WidgetBuilderFunctions {

  static _updateUserHeroFighters() async {
    await DatabaseReference.updateUserHeroFighters(
        GameController.getUser().getUserId(),
        GameController.getHeroFighters());
  }
  static _updateHeroRelic(Her0 hero, Relic relic) async {
    await DatabaseReference.updateHeroRelic(hero, relic);
    hero.setRelicId(relic.getRelicId());
    hero.setRelic();
  }

  static appBar(Screens screen, String titleScreen, {String? specificAudio}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: InkWell(
        onTap: () {
          if (specificAudio == null) {
            Audio.play(Audio.getAudio(screen), audioVoiceType: true);
          }
          else {
            Audio.play(specificAudio, audioVoiceType: true);
          }
        },
        child:
        Center(child: Text(titleScreen, style: const TextStyle(
            color: Colors.black, fontSize: ScreenConstants.titleTextSize, fontWeight: FontWeight.bold))),
      ),
    );
  }

  /*static _addImageToQuadrant(imageSrc, Quadrants quadrant,
      {required bool hasHeroImage, required bool hasImage}){

    if (hasImage) {
      double ratio = hasHeroImage ? ScreenConstants.imageHeroMenuRatio : ScreenConstants.imageMenuRatio;

      return Column(
        mainAxisAlignment: (quadrant == Quadrants.TOP_LEFT ||
            quadrant == Quadrants.TOP_RIGHT)?
        MainAxisAlignment.center: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          const SizedBox(height: 15,),
          Image(image: AssetImage(imageSrc),
            height: (ScreenConstants.screenHeight / ratio),),
        ],
      );
    }
    return const SizedBox(height: 0,);
  }
*/
  static _addGalaxyQuadrant(Quadrants quadrant, {required bool isHeroPage}) {
    return Column(
      mainAxisAlignment: (quadrant == Quadrants.TOP_RIGHT ||
          quadrant == Quadrants.TOP_LEFT) ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image(image: AssetImage((quadrant == Quadrants.TOP_RIGHT ||
            quadrant == Quadrants.TOP_LEFT) ? AssetsConstants.galaxyImage1 :
        AssetsConstants.galaxyImage1Inv), ),
      ],
    );
  }
  static _addHeroBackground(bool isHeroPage) {
    if (isHeroPage) {
      Her0 hero = GameController.getCurrentHeroPage();
      Elements element = hero.getCharacter()!.getElement();

      return Stack(
        children: [
          Container(
            height: ScreenConstants.screenHeight,
            width:  ScreenConstants.screenWidth,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage(AssetsConstants.elementsBgImageSrcs[element]!),
              fit: BoxFit.fill,),),),
          Container(
            height: ScreenConstants.screenHeight,
            width:  ScreenConstants.screenWidth,
            decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage(AssetsConstants.imageShine),
              fit: BoxFit.fill,),),),
        ],
      );
    }
    return const SizedBox(height: 0,);
  }

  static _noImageQuadrant(context, Color background, String title,) {
    return Container(
      height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
      width: (ScreenConstants.screenWidth / 2),
      color: background,
      child:
      Stack(
        children: <Widget> [
          Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                  height: (ScreenConstants.screenWidth / 2) - 10,
                  width:  (ScreenConstants.screenWidth / 2) - 10,
                  padding: const EdgeInsets.only(bottom: ScreenConstants.bannerTextPadding),
                  decoration: const BoxDecoration(image: DecorationImage(
                    image: AssetImage(AssetsConstants.frameDefinitionsImageSrc),
                    fit: BoxFit.fill,),),
                  child: Center(child: Text(title,
                    style: const TextStyle(color: Colors.black, fontSize:
                    ScreenConstants.bannerTextSize, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,))),
            ],),],),);
  }
  static _addImageToQuadrant(quadrant, String imageSrc, double ratio) {
    if (imageSrc == "") {
      return const SizedBox(height: 0,);
    }
    return Column(
      mainAxisAlignment: (quadrant == Quadrants.TOP_LEFT ||
          quadrant == Quadrants.TOP_RIGHT)?
      MainAxisAlignment.center: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        const SizedBox(height: 10,),
        Image(image: AssetImage(imageSrc),
          height: (ScreenConstants.screenHeight / ratio),),
      ],
    );
  }
  static _addAudioDefinitionsButtons(context, Quadrants quadrant, String title, Color background){

    String audio = (quadrant == Quadrants.TOP_LEFT) ? AssetsConstants.audioVolumeVoice :
    (quadrant == Quadrants.TOP_RIGHT) ? AssetsConstants.audioVolumeSounds :
    (quadrant == Quadrants.BOTTOM_LEFT) ? AssetsConstants.audioSpeedVoice:
    AssetsConstants.audioLanguage;

    return InkWell(
        onTap: () => Audio.play(audio, audioVoiceType: true),
        onDoubleTap: () {
          if (quadrant == Quadrants.BOTTOM_RIGHT) {
            ChangePage.toLanguagePage(context);
          }
          else {
            ScreenConstants.changeAudioPage = (quadrant == Quadrants.TOP_LEFT) ?
            AudioChange.VOICE : (quadrant == Quadrants.TOP_RIGHT) ?
            AudioChange.SOUND : AudioChange.SPEED;
            ChangePage.toChangeAudioPage(context);
          }
        },
        child:
        _noImageQuadrant(context, background, title)
    );
  }
  static _addQuadrant (context, Screens screen, Quadrants quadrant, Color background,
      String title, String imageSrc, {required bool hasHeroImage, required bool isHeroPage}) {
    double ratio = hasHeroImage ? ScreenConstants.imageHeroMenuRatio : ScreenConstants.imageMenuRatio;

      return Container(
            height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
            width: (ScreenConstants.screenWidth / 2),
            color: background,
            child:
            Stack(
              children: <Widget> [
                _addGalaxyQuadrant(quadrant, isHeroPage: isHeroPage),
                _addImageToQuadrant(quadrant, imageSrc, ratio),
                Column(
                  mainAxisAlignment: (quadrant == Quadrants.TOP_LEFT ||
                      quadrant == Quadrants.TOP_RIGHT)? MainAxisAlignment.start: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    const SizedBox(height: 15,),
                    Container(
                        height: ScreenConstants.bannerHeight,
                        width:  (ScreenConstants.screenWidth / 2),
                        padding: const EdgeInsets.only(bottom: ScreenConstants.bannerTextPadding + 13),

                        decoration: const BoxDecoration(image: DecorationImage(
                          image: AssetImage(AssetsConstants.faixaImageSrc),
                          fit: BoxFit.fill,),),

                        child: Center(child: Text(title,
                          style: const TextStyle(color: Colors.black, fontSize:
                          ScreenConstants.bannerTextSize,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,))),
                  ],
                ),
              ],
            ),
          );
  }
  static _addButtons (context, Screens screen, Quadrants quadrant,
      Color background, String title, String imageSrc, {required bool hasImage,
  required bool hasHeroImage, required bool isHeroPage, required bool changingAudio}) {

    if (isHeroPage) {return _addQuadrant(context, screen, quadrant, background,
        title, imageSrc, isHeroPage: isHeroPage, hasHeroImage: hasHeroImage);}
    if (changingAudio) { return _addAudioDefinitionsButtons(context, quadrant, title, background); }
    if (!hasImage) {
      return InkWell(
          onTap: () {
            String audio = (GameController.muteVibration && quadrant == Quadrants.BOTTOM_LEFT) ?
            AssetsConstants.audioActivateVibration :
            (!GameController.muteVibration && quadrant == Quadrants.BOTTOM_LEFT) ?
            AssetsConstants.audioDeactivateVibration : Audio.getAudio(screen);
            Audio.play(audio, audioVoiceType: true);
          },
          onDoubleTap: () {
            if (quadrant == Quadrants.BOTTOM_LEFT) {
              GameController.setMuteVibration(!GameController.getMuteVibration());
              Audio.play((GameController.getMuteVibration()) ? AssetsConstants.audioVibrationDeactivated :
              AssetsConstants.audioVibrationActivated, audioVoiceType: true);
            }
            else {
              ChangePage.toSetterPage(context, screen);
            }
          },
        child: _noImageQuadrant(context, background, title));
    }
    return InkWell(
        onTap: () => Audio.play(Audio.getAudio(screen), audioVoiceType: true),
        onDoubleTap: () {
          if (screen == Screens.FIGHT_PAGE) {
            if (GameController.getHeroFighters().length == 4) {
              _updateUserHeroFighters();
              ChangePage.toFightPage(context);
            }
            else {
              Audio.play(AssetsConstants.audioSelecionarHeroes, audioVoiceType: true);
              Vibration.intenseVibration(5, 60);
            }
          }
          else {
            ChangePage.toSetterPage(context, screen);
          }
        },
        child:
        _addQuadrant(context, screen, quadrant, background, title, imageSrc,
            isHeroPage: isHeroPage, hasHeroImage: hasHeroImage)
    );
  }

  static quadrantsWidget (context, List<Screens> screens,
      List<String> titles, List<String> imageSrcs, List<Color> colors,
      {bool? hasImage, bool? hasHeroImage, bool? isHeroPage, bool? changingAudio}) {

    hasImage = hasImage ?? true;
    hasHeroImage = hasHeroImage ?? false;
    isHeroPage = isHeroPage ?? false;
    changingAudio = changingAudio ?? false;

    return Stack( children: [
      _addHeroBackground(isHeroPage),
      Column(
        children: [
          Row(
            children: [
              _addButtons(context,
                  screens[0], Quadrants.TOP_LEFT, colors[0], titles[0], imageSrcs[0],
                  hasImage: hasImage, hasHeroImage: hasHeroImage, isHeroPage: isHeroPage,
                  changingAudio: changingAudio),
              _addButtons(context,
                  screens[1], Quadrants.TOP_RIGHT, colors[1], titles[1], imageSrcs[1],
                  hasImage: hasImage, hasHeroImage: hasHeroImage, isHeroPage: isHeroPage,
                  changingAudio: changingAudio),
            ],
          ),
          Row(
            children: [
              _addButtons(context,
                  screens[2], Quadrants.BOTTOM_LEFT, colors[2], titles[2], imageSrcs[2],
                  hasImage: hasImage, hasHeroImage: hasHeroImage, isHeroPage: isHeroPage,
                  changingAudio: changingAudio),
              _addButtons(context,
                  screens[3], Quadrants.BOTTOM_RIGHT, colors[3], titles[3], imageSrcs[3],
                  hasImage: hasImage, hasHeroImage: hasHeroImage, isHeroPage: isHeroPage,
                  changingAudio: changingAudio),
            ],
          ),
        ],
      )]);
  }

  static quadrantsButtons (context, {required bool isMyHeroPage}) {

    Her0 hero = GameController.getCurrentHeroPage();
    String heroNameAudio = AssetsConstants.heroesAudio[hero.getHero()]!;

    if (isMyHeroPage) {
      return Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    List<String> audioAssets = [
                      AssetsConstants.audioHeroStats,
                      heroNameAudio
                    ];
                    Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                  },
                  onDoubleTap: () {
                    List<String> audioAssets = [
                      AssetsConstants.elementsAudio[hero.getCharacter()?.getElement()]!,
                      AssetsConstants.audioLevel[hero.getHeroLevel()!],
                      AssetsConstants.audioLife[hero.getHeroLife()!],
                      AssetsConstants.audioForce[hero.getHeroPower()!]
                    ];
                    Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                  },
                  child: SizedBox(
                    height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                    width: (ScreenConstants.screenWidth / 2),)
              ),
              InkWell(
                  onTap: () {
                    List<String> audioAssets = [
                      AssetsConstants.audioHeroHistory,
                      heroNameAudio
                    ];
                    Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                  },
                  onDoubleTap: () => Audio.play(AssetsConstants.audioComingSoon, audioVoiceType: true),
                  child: SizedBox(
                    height: ((ScreenConstants.screenHeight -
                        ScreenConstants.screenBarHeight) / 2),
                    width: (ScreenConstants.screenWidth / 2),)
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                  onTap: () => Audio.play(AssetsConstants.audioEquipRelic, audioVoiceType: true),
                  onDoubleTap: () => ChangePage.toEquipPage(context),
                  child: SizedBox(
                    height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                    width: (ScreenConstants.screenWidth / 2),)
              ),
              InkWell(
                  onTap: () {
                    List<String> audioAssets = [
                      AssetsConstants.audioMergeHero,
                      heroNameAudio
                    ];
                    Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                  },
                  onDoubleTap: () => Audio.play(AssetsConstants.audioComingSoon, audioVoiceType: true),
                  child: SizedBox(
                    height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                    width: (ScreenConstants.screenWidth / 2),)
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  List<String> audioAssets = [
                    AssetsConstants.audioHeroStats,
                    heroNameAudio
                  ];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                onDoubleTap: () {
                  List<String> audioAssets = [
                    AssetsConstants.elementsAudio[hero.getCharacter()?.getElement()]!,
                    AssetsConstants.audioLife[hero.getCharacter()!.getInitialLife()],
                    AssetsConstants.audioForce[hero.getCharacter()!.getInitialPower()]
                  ];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                child: SizedBox(
                  height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),)
            ),
            InkWell(
                onTap: () {
                  List<String> audioAssets = [
                    AssetsConstants.audioHeroHistory,
                    heroNameAudio
                  ];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                onDoubleTap: () => Audio.play(AssetsConstants.audioComingSoon, audioVoiceType: true),
                child: SizedBox(
                  height: ((ScreenConstants.screenHeight -
                      ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),)
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  List<String> audioAssets = [
                    AssetsConstants.audioHeroMoreStats,
                    heroNameAudio];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                onDoubleTap: () {
                  List<String> audioAssets = [
                    AssetsConstants.audioTier[hero.getCharacter()!.getTier()],
                    AssetsConstants.audioHeroType[hero.getCharacter()!.getType()]!
                  ];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                child: SizedBox(
                  height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),)
            ),
            InkWell(
                onTap: () {
                  List<String> audioAssets = [
                    AssetsConstants.audioSpecialPower,
                    heroNameAudio
                  ];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                onDoubleTap: () => Audio.play(AssetsConstants.audioStillToDiscover, audioVoiceType: true),
                child: SizedBox(
                  height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),)
            ),
          ],
        ),
      ],
    );
  }
  static centerHero(context){

    Her0 hero = GameController.getCurrentHeroPage();
    String heroImageSrc = AssetsConstants.heroesImageSrcs[hero.getHero()]!;
    return SizedBox(
        width: ScreenConstants.screenWidth,
        height: ScreenConstants.screenHeight,
        child:
            Stack(
              children: [
                Center(child: Image(image: AssetImage(heroImageSrc),
                  height: (ScreenConstants.screenHeight / 1.65),),),
              ],
            )
    );
  }
  static centerHeroButton(context){

    Her0 hero = GameController.getCurrentHeroPage();
    String heroPhrase = AssetsConstants.heroesAudioPhrases[hero.getHero()]!;
    return SizedBox(
        width: ScreenConstants.screenWidth,
        height: ScreenConstants.screenHeight,
        child:
        Stack(
          children: [
            Center(child: InkWell(
                onTap: () => Audio.play(heroPhrase, audioVoiceType: true, isHeroPhrase: true),
                onDoubleTap: () => Audio.play(heroPhrase, audioVoiceType: true, isHeroPhrase: true),
                child:
                SizedBox(height: ScreenConstants.screenHeight / 2.5,
                  width: ScreenConstants.screenWidth / 2.5,)))
          ],
        )
    );
  }

  static chestReward(context){
    return SizedBox(
        width: ScreenConstants.screenWidth,
        height: ScreenConstants.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Container(
                height: ScreenConstants.bannerHeight,
                width: (ScreenConstants.screenWidth / 1.6),
                padding: const EdgeInsets.only(top: ScreenConstants.bannerTextPadding),

                decoration: const BoxDecoration(image: DecorationImage(
                  image: AssetImage(AssetsConstants.faixaImageSrc),
                  fit: BoxFit.fill,),),

                child: const Text(ScreenConstants.rewardTitle,
                  style: TextStyle(color: Colors.black, fontSize:
                  ScreenConstants.bannerTextSize,
                      fontWeight: FontWeight.bold), textAlign: TextAlign.center, )),
            InkWell(
              onTap: () => Audio.play(AssetsConstants.audioRecompensas, audioVoiceType: true),
              onDoubleTap: () async {
                Audio.play(AssetsConstants.audioMagicButton, audioVoiceType: false);
                await showDialog(context: context, builder: (_) => const ImageReward());},
              child:
              Image(image: const AssetImage(AssetsConstants.rewardImageSrc),
                width: (ScreenConstants.screenWidth / 3),),
            )
          ],
        )
    );
  }




  static comingSoonWidget() {
    return InkWell(
        onTap: () => Audio.play(AssetsConstants.audioComingSoon, audioVoiceType: true),
        onDoubleTap: () => Audio.play(AssetsConstants.audioComingSoon, audioVoiceType: true),
        child:
        Container(
      height: ScreenConstants.screenHeight,
      width:  ScreenConstants.screenWidth,
      decoration: const BoxDecoration(image: DecorationImage(
        image: AssetImage(AssetsConstants.comingSoonScreenImageSrc),
        fit: BoxFit.fill,),),)
    );
  }




  static _updateSelectedHeroes(Her0 hero, int level, int position) {
    GameController.setHeroFighters(hero, position);

    GameController.heroFighters.forEach((key, value) {
      if (key != position) {
        if (value.getHeroId() == hero.getHeroId()) {
          GameController.setHeroFighters(Her0.defaultHero(), key);
        }
      }
    });
    ScreenConstants.pageIndex = 0;
  }

  static _addPosition(bool heroSelection, int position) {
    if(heroSelection){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 1,),
          Container(
            width: (ScreenConstants.screenWidth / 8),
            height: (ScreenConstants.screenWidth / 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          child: Text('$position',
            style: TextStyle(
                color: Colors.black, fontSize: (ScreenConstants.screenWidth / 8) - 5,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,)
      )]);

    }
    return const SizedBox(height: 0,);
  }
  static _addLevel(int level, bool withLevel) {
    if(withLevel){
      return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: ScreenConstants.bannerHeight - 25,),
                Container(
                    width: (ScreenConstants.screenWidth / 8),
                    height: (ScreenConstants.screenWidth / 8),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(AssetsConstants.levelImageSrc),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Text('$level',
                      style: TextStyle(
                          color: Colors.black, fontSize: (ScreenConstants.screenWidth / 8) - 5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,)
                )])]);
    }
    return const SizedBox(height: 1,);
  }
  static _addHero(Her0 hero, {required bool showLevel, required bool showPosition,
      positionNumber, heroLevel}){
    Elements element = hero.getCharacter()!.getElement();
    String title = hero.getCharacter()!.getName();
    Color background = AssetsConstants.elementsColor[element]!;
    String imageSrc = AssetsConstants.heroesImageSrcs[hero.getHero()]!;

    int level = heroLevel ?? 0;
    int position = positionNumber ?? 0;

    return Container(
        height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
        width: (ScreenConstants.screenWidth / 2),
        color: Colors.black,
        padding: const EdgeInsets.all(3),
        child:
        Container(
          color: background,
          child:
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 6.5,),

                      Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20,),
                            Image(image: AssetImage(imageSrc),
                              height: (ScreenConstants.screenHeight /
                                  ScreenConstants.imageHeroMenuRatio),),
                          ],
                        ),
                        Container(
                            height: ScreenConstants.bannerHeight,
                            width: (ScreenConstants.screenWidth / 2),
                            padding: const EdgeInsets.only(
                                top: ScreenConstants.bannerTextPadding),

                            decoration: const BoxDecoration(image: DecorationImage(
                              image: AssetImage(AssetsConstants.faixaImageSrc),
                              fit: BoxFit.fill,),),

                            child: Text(title,
                              style: const TextStyle(
                                  color: Colors.black, fontSize:
                                  ScreenConstants.bannerTextSize,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,)),
                        _addLevel(level, showLevel),
                      ],),

                    ],
                  ),

                  _addPosition(showPosition, position)
                ],
              )

        ));
  }

  static _addWaitingHero (context, int position) {
    return InkWell(
        onTap: () => Audio.play(AssetsConstants.audioNoHero, audioVoiceType: true),
        onDoubleTap: () => ChangePage.toSelectHeroesPage(context, position),
        child:Container(
            height: ((ScreenConstants.screenHeight -
                ScreenConstants.screenBarHeight) / 2),
            width: (ScreenConstants.screenWidth / 2),
            color: Colors.black,
            padding: const EdgeInsets.all(3),
            child:
            Container(
              color: Colors.grey,
              child:
                  Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: const AssetImage(AssetsConstants.noHeroImageSrc),
                              width: (ScreenConstants.screenWidth / 2) - 6,),
                          ],
                        ),
                    ],),

                    _addPosition(true, position),
                  ],)

            ))
    );
  }
  static _addNoHero () {
    return InkWell(
        onTap: () => Audio.play(AssetsConstants.audioNoHero, audioVoiceType: true),
        onDoubleTap: () => Audio.play(AssetsConstants.audioNoHero, audioVoiceType: true),
        child:Container(
            height: ((ScreenConstants.screenHeight -
                ScreenConstants.screenBarHeight) / 2),
            width: (ScreenConstants.screenWidth / 2),
            color: Colors.black,
            padding: const EdgeInsets.all(3),
            child:
            Container(
              color: Colors.grey,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Center(child: Text('N0',
                    style: TextStyle(
                        color: Colors.black, fontSize: 40,
                        fontWeight: FontWeight.bold, backgroundColor: Colors.white),
                    textAlign: TextAlign.center,)),
                  SizedBox(height: 7.5,),
                  Center(child: Text('HERO',
                    style: TextStyle(
                        color: Colors.black, fontSize: 40,
                        fontWeight: FontWeight.bold, backgroundColor: Colors.white),
                    textAlign: TextAlign.center,))
                ],
              ),
            ))
    );
  }
  static _addOpponentsButtons(Her0 hero) {
    return InkWell(
        onTap: () => Audio.play(AssetsConstants.heroesAudio[hero.getHero()]!, audioVoiceType: true),
        onDoubleTap: () {
          List<String> audioAssets = [
            AssetsConstants.elementsAudio[hero.getCharacter()?.getElement()]!,
            AssetsConstants.audioLevel[hero.getHeroLevel()!],
            AssetsConstants.audioLife[hero.getHeroLife()!],
            AssetsConstants.audioForce[hero.getHeroPower()!]
          ];
          Audio.waitingToPlay(audioAssets, audioVoiceType: true);
          },
        child:
        _addHero(hero, showLevel: true, showPosition: false,
            heroLevel: GameController.getChapterOpponentsLevel()),
    );
  }
  static _addChoosePositionButtons(context, Her0 hero, int position) {
    int level = hero.getHeroLevel()!;
    return InkWell(
      onTap: () async {
        List<String> audioAssets = [
          AssetsConstants.audioPosition[position],
          AssetsConstants.heroesAudio[hero.getHero()]!,
          AssetsConstants.audioLevel[hero.getHeroLevel()!],
          AssetsConstants.audioLife[hero.getHeroLife()!],
          AssetsConstants.audioForce[hero.getHeroPower()!]
        ];
        Audio.waitingToPlay(audioAssets, audioVoiceType: true);
        },
      onDoubleTap: () => ChangePage.toSelectHeroesPage(context, position),
      child:
      _addHero(hero, showLevel: true, showPosition: true, positionNumber: position,
          heroLevel: level),
    );
  }
  static _addSelectFighterButtons(context, Her0 hero){
    int level = hero.getHeroLevel()!;
    return InkWell(
      onTap: () { List<String> audioAssets = [
          AssetsConstants.heroesAudio[hero.getHero()]!,
          AssetsConstants.audioLevel[hero.getHeroLevel()!],
          AssetsConstants.audioLife[hero.getHeroLife()!],
          AssetsConstants.audioForce[hero.getHeroPower()!]
        ];
        Audio.waitingToPlay(audioAssets, audioVoiceType: true);
      },
      onDoubleTap: () {
        _updateSelectedHeroes(hero, level, (GameController.getSelectedPosition() - 1));
        ChangePage.toChoosePositionPage(context);
        Vibration.heartPattern(1);
      },
      child:
      _addHero(hero, showLevel: true, showPosition: false, heroLevel: level),
    );
  }
  static _addMyHeroesButtons(context, Her0 hero){
    int level = hero.getHeroLevel()!;
    return InkWell(
      onTap: () => Audio.play(AssetsConstants.heroesAudio[hero.getHero()]!, audioVoiceType: true),
      onDoubleTap: () => ChangePage.toHeroPage(context, hero, isMyHeroPage: true),
      child:
      _addHero(hero, showLevel: true, showPosition: false, heroLevel: level),
    );
  }
  static _addHeroesButtons(context, Her0 hero){
    return InkWell(
        onTap: () => Audio.play(AssetsConstants.heroesAudio[hero.getHero()]!, audioVoiceType: true),
        onDoubleTap: () => ChangePage.toHeroPage(context, hero, isMyHeroPage: false),
        child:
        _addHero(hero, showLevel: false, showPosition: false),
    );
  }

  static _addHeroContainer(context, Her0 hero, bool isMyHeroes,
      bool choosingPosition, bool opponents, bool selectingFighter, int position){
    if (hero.getHero() == Heroes.DEFAULT_HERO && choosingPosition){ return _addWaitingHero(context, position);}
    if (hero.getHero() == Heroes.DEFAULT_HERO){ return _addNoHero();}
    if (opponents) { return _addOpponentsButtons(hero);}
    if (choosingPosition) { return _addChoosePositionButtons(context, hero, position);}
    if (selectingFighter) { return _addSelectFighterButtons(context, hero);}
    if (isMyHeroes) { return _addMyHeroesButtons(context, hero);}
    return _addHeroesButtons(context, hero);
  }
  static heroesQuadrants (context, List<Her0> heroes, {bool? isMyHeroes,
    bool? opponents, bool? choosingPosition, bool? selectingFighter}){

    isMyHeroes = isMyHeroes ?? false;
    opponents = opponents ?? false;
    choosingPosition = choosingPosition ?? false;
    selectingFighter = selectingFighter ?? false;

    for (int i = 0; i < 4; i++){
      if (i >= heroes.length) {
        heroes.add(Her0.defaultHero());
      }
    }

    return Column(
      children: [
        Row(
          children: [
            _addHeroContainer(context, heroes[0], isMyHeroes, choosingPosition,
                opponents, selectingFighter, 1),
            _addHeroContainer(context, heroes[1], isMyHeroes, choosingPosition,
                opponents, selectingFighter, 2),
          ],
        ),
        Row(
          children: [
            _addHeroContainer(context, heroes[2], isMyHeroes, choosingPosition,
                opponents, selectingFighter, 3),
            _addHeroContainer(context, heroes[3], isMyHeroes, choosingPosition,
                opponents, selectingFighter, 4),
          ],
        ),
      ],
    );
  }





  static _addRelic(Relic relic){
    Elements element = relic.getItem()!.getElement();
    String title = relic.getItem()!.getName();
    Color background = AssetsConstants.elementsColor[element]!;
    String imageSrc = AssetsConstants.relicsImageSrcs[relic.getRelic()]!;

    return Container(
        height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
        width: (ScreenConstants.screenWidth / 2),
        color: Colors.black,
        padding: const EdgeInsets.all(3),
        child:
        Container(
            color: background,
            child:
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 6.5,),

                    Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20,),
                          Image(image: AssetImage(imageSrc),
                            height: (ScreenConstants.screenHeight /
                                ScreenConstants.imageHeroMenuRatio),),
                        ],
                      ),
                      Container(
                          height: ScreenConstants.bannerHeight,
                          width: (ScreenConstants.screenWidth / 2),
                          padding: const EdgeInsets.only(
                              top: ScreenConstants.bannerTextPadding),

                          decoration: const BoxDecoration(image: DecorationImage(
                            image: AssetImage(AssetsConstants.faixaImageSrc),
                            fit: BoxFit.fill,),),

                          child: Text(title,
                            style: const TextStyle(
                                color: Colors.black, fontSize:
                            ScreenConstants.bannerTextSize,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,)),
                    ],),
                  ],
                ),
              ],
            )

        ));
  }
  static _addMyRelicsButtons(context, Relic relic){
    return InkWell(
      onTap: () => Audio.play(AssetsConstants.relicsAudio[relic.getRelic()]!, audioVoiceType: true),
      onDoubleTap: () => Audio.play(AssetsConstants.relicsAudio[relic.getRelic()]!, audioVoiceType: true),
      child:
      _addRelic(relic),
    );
  }
  static _addRelicsToEquipButtons(context, Relic relic, Her0 hero) {
    return InkWell(
      onTap: () async {
        List<String> audioAssets = [
          AssetsConstants.relicsAudio[relic.getRelic()]!,
          AssetsConstants.audioLevel[relic.getRelicLevel()!],
          AssetsConstants.audioLife[relic.getRelicLife()!],
          AssetsConstants.audioForce[relic.getRelicPower()!]
        ];
        Audio.waitingToPlay(audioAssets, audioVoiceType: true);
      },
      onDoubleTap: () {
        _updateHeroRelic(hero, relic);
        ChangePage.toHeroPage(context, hero, isMyHeroPage: true);
        Vibration.heartPattern(1);
        },
      child:
      _addRelic(relic),
    );
  }
  static _addNoRelic() {
    return InkWell(
        onTap: () => Audio.play(AssetsConstants.audioNoRelic, audioVoiceType: true),
        onDoubleTap: () => Audio.play(AssetsConstants.audioNoRelic, audioVoiceType: true),
        child:Container(
            height: ((ScreenConstants.screenHeight -
                ScreenConstants.screenBarHeight) / 2),
            width: (ScreenConstants.screenWidth / 2),
            color: Colors.black,
            padding: const EdgeInsets.all(3),
            child:
            Container(
              color: Colors.grey,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Center(child: Text('N0',
                    style: TextStyle(
                        color: Colors.black, fontSize: 40,
                        fontWeight: FontWeight.bold, backgroundColor: Colors.white),
                    textAlign: TextAlign.center,)),
                  SizedBox(height: 7.5,),
                  Center(child: Text('RELIC',
                    style: TextStyle(
                        color: Colors.black, fontSize: 40,
                        fontWeight: FontWeight.bold, backgroundColor: Colors.white),
                    textAlign: TextAlign.center,))
                ],
              ),
            ))
    );
  }
  static _addRelicContainer(context, Relic relic, bool equipRelic, Her0 hero){
    if (relic.getRelic() == Relics.DEFAULT_RELIC) { return _addNoRelic(); }
    if (equipRelic) { return _addRelicsToEquipButtons(context, relic, hero);}
    return _addMyRelicsButtons(context, relic);
  }
  static relicsQuadrants (context, List<Relic> relics, {bool? equipRelic, Her0? hero}){

    equipRelic = equipRelic ?? false;
    hero = hero ?? Her0.defaultHero();

    for (int i = 0; i < 4; i++){
      if (i >= relics.length) {
        relics.add(Relic.defaultRelic());
      }
    }

    return Column(
      children: [
        Row(
          children: [
            _addRelicContainer(context, relics[0], equipRelic, hero),
            _addRelicContainer(context, relics[1], equipRelic, hero),
          ],
        ),
        Row(
          children: [
            _addRelicContainer(context, relics[2], equipRelic, hero),
            _addRelicContainer(context, relics[3], equipRelic, hero),
          ],
        ),
      ],
    );
  }
}

class ImageReward extends StatelessWidget {
  const ImageReward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Vibration.heartPattern(2);

    //DatabaseReference.updateUserStats(GameConstants.expReward, GameConstants.fusionReward, GameConstants.gemsReward);
    //List<String> relics = UserRelic.addRandomRelics(GameConstants.numRelicsReward);
    //DatabaseReference.addUserRelics(relics);

    String? timeStr = GameController.getUser().getTimeCollected();
    DateTime lastTime = DateTime.parse(timeStr!);
    if (kDebugMode) {
      print("lastTime: $lastTime");
    }
    String timePassed = GameController.collectReward(lastTime);

    return GestureDetector(
        onVerticalDragEnd: (dragEndDetails) async {
          // Swipe Up
          if (dragEndDetails.primaryVelocity! < 0) {
            Audio.play(AssetsConstants.audioButton, audioVoiceType: false);
            Navigator.pop(context);
          }
          // Swipe Down
          else if (dragEndDetails.primaryVelocity! > 0) {
            Audio.play(AssetsConstants.audioButton, audioVoiceType: false);
            Navigator.pop(context);
          }
        },
        onHorizontalDragEnd: (dragEndDetails) {
          // Page forwards
          if (dragEndDetails.primaryVelocity! < 0) {}
          // Page backwards
          else if (dragEndDetails.primaryVelocity! > 0) {}
          },
        child: Dialog(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
          child: InkWell(
            onTap: () {
              },
            onDoubleTap: () {
              Audio.play(AssetsConstants.audioButton, audioVoiceType: false);
              Navigator.pop(context);
            },
            child: Stack(
              children: [
                Image(image: const AssetImage(AssetsConstants.rewardScrollImageSrc),
                    width: ScreenConstants.screenWidth,
                    height: ScreenConstants.screenHeight,
                    fit: BoxFit.fill),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 15,),
                    Center(child: Text(timePassed, style: const TextStyle(
                        color: Colors.lightGreenAccent, fontSize: 35,
                        fontWeight: FontWeight.bold, backgroundColor: Colors.black),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       _rewards(AssetsConstants.expImageScr, "${GameController.getExpReward()} EXP"),
                       _rewards(AssetsConstants.fusionImageScr, "${GameController.getFusionReward()} Fusions"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        _rewards(AssetsConstants.gemImageScr, "${GameController.getGemsReward()} Gems"),
                        _rewards(AssetsConstants.chaliceIconImageScr, "${GameController.getNumRelicsReward()} Relics"),
                      ],
                    ),
                    const SizedBox(height: 15,),
                  ],
                )
              ],
            ),
          ),
        ));
  }
  _rewards(String rewardSrc, String text) {
    return Stack(
        children: [
          Image(
              image: const AssetImage(AssetsConstants.rewardsFrameImageSrc),
              width: (ScreenConstants.screenWidth / 3),
              height: (ScreenConstants.screenHeight/ 4),
              fit: BoxFit.fill),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                  image: AssetImage(rewardSrc),
                  width: (ScreenConstants.screenWidth / 3)),
              Center(
                  child: Text(text, style: const TextStyle(
                      color: Colors.white, fontSize: 25,
                      fontWeight: FontWeight.bold, backgroundColor: Colors.black),)),
            ],
          )
        ]);
  }
}