import 'dart:async';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

import '../../vibration.dart';
import '../../widget_builder.dart';
import '../../audio.dart';
import '../../change_page.dart';
import '../../game_controller.dart';
import '../../constants/assets_constants.dart';
import '../../constants/db_constants.dart';
import '../../constants/screen_constants.dart';
import '../../database/hero.dart';

class FightPage extends StatefulWidget {
  const FightPage({Key? key}) : super(key: key);

  @override
  _FightPageState createState() => _FightPageState();

}

class _FightPageState extends State<FightPage> with TickerProviderStateMixin {

  List<String> heroesImageSrcs =  ["", "", "", ""];
  List<String> enemiesImageSrcs = ["", "", "", ""];
  List<Color> heroesColors =  [Colors.white, Colors.white, Colors.white, Colors.white];
  List<Color> enemiesColors = [Colors.black, Colors.black, Colors.black, Colors.black];
  static List<List<int>> heroesStats =  [[0,0], [0,0], [0,0], [0,0]];
  static List<List<int>> enemiesStats = [[0,0], [0,0], [0,0], [0,0]];
  static List<int> additionalStats =    [0,0];

  List<String> audioAssets = [];

  late AnimationController fighterAnimationController;
  late AnimationController opponentAnimationController;
  late AnimationController newFighterAnimationController;
  late AnimationController newOpponentAnimationController;

  late Animation<double> fighterScaling;
  late Animation<double> opponentScaling;

  /// convert 0-1 to 0-1-0
  double shake(double value) =>
      3 * (0.5 - (0.5 - (value * 1)).abs());

  double width =      (ScreenConstants.screenWidth / 2);

  @override
  initState() {
    super.initState();
    if (GameController.canBeginFight()) {
      _addStats();
      _resetVariables();
    }
    fighterAnimationController =  AnimationController(duration: const Duration(milliseconds: 300),
        vsync: this)..addListener(() {
      if (fighterAnimationController.isCompleted) {
        fighterAnimationController.reverse();
      }
    });
    opponentAnimationController = AnimationController(duration: const Duration(milliseconds: 300),
        vsync: this)..addListener(() {
      if (opponentAnimationController.isCompleted) {
        opponentAnimationController.reverse();
      }
    });
    newFighterAnimationController =  AnimationController(duration: const Duration(milliseconds: 450),
        vsync: this);
    newOpponentAnimationController = AnimationController(duration: const Duration(milliseconds: 450),
        vsync: this);

    fighterScaling =  Tween<double>(begin: 0, end: width, ).animate(newFighterAnimationController)
      ..addListener(() {
        setState(() {});
    });
    newFighterAnimationController.forward();

    opponentScaling = Tween<double>(begin: 0, end: width, ).animate(newOpponentAnimationController)
      ..addListener(() {
        setState(() {});
    });
    newOpponentAnimationController.forward();

    _addHeroesAssets();
  }

  @override
  void dispose() {
    fighterAnimationController.dispose();
    opponentAnimationController.dispose();
    newFighterAnimationController.dispose();
    newOpponentAnimationController.dispose();
    super.dispose();
  }

  _resetVariables() {
    GameController.setHeroIndex(0);
    GameController.setEnemyIndex(0);
    GameController.setBeginFight(false);
    GameController.setEndFight(false);
  }

  _addStats() {
    int index = 8;
    for (int i = 0; i < GameController.getHeroFighters().length; i++) {
      Her0 hero = GameController.getHeroFighters()[i]!;
      index = _addSpecialPower(hero, i);
      heroesStats[i] = [hero.getHeroLife()!, hero.getHeroPower()!];
    }
    for (int i = 0; i < GameController.getHeroOpponents().length; i++) {
      Her0 enemy = GameController.getHeroOpponents()[i]!;
      enemiesStats[i] = [enemy.getHeroLife()!, enemy.getHeroPower()!];
    }
    if (index < GameController.getHeroFighters().length) {
      heroesStats[index] = [heroesStats[index][0] + additionalStats[0],
                            heroesStats[index][1] + additionalStats[1]];
    }
  }
  int _addSpecialPower(Her0 hero, int index) {
    if (hero.getRelic() != null) {
      if (hero.getRelic()?.getItem()?.getCharacter()?.getName() == hero.getCharacter()?.getName()) {
        if (hero.getHero() == Heroes.NAGA_KANYA) {
          additionalStats = [2, 0];
          heroesStats[index - 1] = [(heroesStats[index - 1][0] + 2), heroesStats[index - 1][1]];
          return      index + 1;
        }
      }
    }
    return 8;
  }
  _addHeroesAssets() {
    for (int i = 0; i < GameController.getHeroFighters().length; i++) {
      Her0 hero = GameController.getHeroFighters()[i]!;
      heroesImageSrcs[i] = AssetsConstants.heroesImageSrcs[hero.getHero()]!;
      heroesColors[i] = AssetsConstants.elementsColor[hero.getCharacter()!.getElement()]!;
    }
    for (int i = 0; i < GameController.getHeroOpponents().length; i++) {
      Her0 enemy = GameController.getHeroOpponents()[i]!;
      enemiesImageSrcs[i] = AssetsConstants.heroesImageSrcs[enemy.getHero()]!;
      enemiesColors[i] = AssetsConstants.elementsColor[enemy.getCharacter()!.getElement()]!;
    }
  }

  _play() async {
    audioAssets = [AssetsConstants.audioPunch];

    Map<String,int> defeated = GameController.fight(
        heroesStats[GameController.getHeroIndex()],
        enemiesStats[GameController.getEnemyIndex()]);

    heroesStats[GameController.getHeroIndex()][0]   = GameController.getHeroLife();
    enemiesStats[GameController.getEnemyIndex()][0] = GameController.getEnemyLife();

    if (defeated.isNotEmpty) {
      // if (defeated.length == 1) {
      //   int heroIndex = GameController.getHeroIndex();
      //   if (defeated.keys.first == GameController.getHeroFighters()[heroIndex]!.getHeroId()) {
      //     opponentLost = false;
      //   }
      //   else {
      //     fighterLost = false;
      //   }
      // }
      _updateGame(context, defeated);
    }
    else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => super.widget));
    }
    Audio.waitingToPlay(audioAssets, audioVoiceType: false, faster: 500);

    // if (GameController.isAutoplay()) {
    //   await Future.delayed(const Duration(milliseconds: 1000), () {});
    // }
  }

  _updateGame(context, Map<String, int> defeated) {
    for (final mapEntry in defeated.entries) {

      int heroIndex = GameController.getHeroIndex();
      if (mapEntry.key == GameController.getHeroFighters()[heroIndex]!.getHeroId()) {
        if (heroIndex < 3){
          audioAssets.add(AssetsConstants.audioWrong);
          Vibration.intenseVibration(5, 50);
          GameController.heroIndex++;
          fighterAnimationController.forward();
        } else {
          GameController.setWon(false);
          audioAssets.add(AssetsConstants.audioResultSong[false]!);
          Vibration.intenseVibration(15, 75);
          ChangePage.toResultPage(context);
          GameController.setEndFight(true);
          break;
        }
      }
      else {
        if (GameController.getEnemyIndex() < 3){
          audioAssets.add(AssetsConstants.audioYeah);
          Vibration.heartPattern(2);
          GameController.enemyIndex++;
          opponentAnimationController.forward();
        } else {
          GameController.setWon(true);
          audioAssets.add(AssetsConstants.audioResultSong[true]!);
          Vibration.heartPattern(6);
          ChangePage.toResultPage(context);
          GameController.setEndFight(true);
          break;
        }
      }

      Timer(const Duration(milliseconds:  800), ()
      {
        if (!GameController.isEndFight()) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
        }
      });
    }
  }


  _combatWidget (context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // hero level
            Stack(
              children: <Widget>[
                Image(
                  image: const AssetImage(AssetsConstants.heroLevelImageSrc),
                  height: (ScreenConstants.screenHeight / 10),),
                Row(
                    children: [
                      const SizedBox(width: 30,),
                      Image(image: AssetImage(AssetsConstants.numbersImage[
                      GameController.getHeroFighters()[GameController.getHeroIndex()]!.getHeroLevel()!
                      ]),
                        height: (ScreenConstants.screenHeight / 12),),
                    ]
                )

              ],
            ),

            // enemy level
            Stack(
              children: <Widget>[
                Image(
                  image: const AssetImage(AssetsConstants.enemyLevelImageSrc),
                  height: (ScreenConstants.screenHeight / 10),),
                Row(
                    children: [
                      const SizedBox(width: 30,),
                      Image(image: AssetImage(
                          AssetsConstants.numbersImage[
                          GameController.getHeroOpponents()[GameController.getEnemyIndex()]!.getHeroLevel()!
                          ]),
                        height: (ScreenConstants.screenHeight / 12),),
                    ]
                )

              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Column(
              children: <Widget>[

                // Hero image
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: fighterScaling.value,
                      child:
                      // Image(image: AssetImage(heroesImageSrcs[GameController.getHeroIndex()]),
                      //   width: fighterScaling.value,),
                      AnimatedBuilder(
                        animation: fighterAnimationController,
                        child: Image.asset(heroesImageSrcs[GameController.getHeroIndex()]),
                        builder: (context, widget) => Transform.translate(
                            offset: Offset(0, shake(fighterAnimationController.value) * 20),
                            child: widget,),
                      ),

                    ),
                  ],
                ),

                // Hero Stats
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(AssetsConstants.heartStatsImageSrc),
                          height: (ScreenConstants.screenHeight / 10),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(
                                AssetsConstants.numbersImage[heroesStats[GameController.getHeroIndex()][0]]),
                              height: (ScreenConstants.screenHeight / 12),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(AssetsConstants.heroStatsImageSrc),
                          height: (ScreenConstants.screenHeight / 10),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(
                                AssetsConstants.numbersImage[heroesStats[GameController.getHeroIndex()][1]]),
                              height: (ScreenConstants.screenHeight / 12),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15,)
              ],
            ),

            Column(
              children: <Widget>[

                // Enemy Image
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: opponentScaling.value,
                      child: AnimatedBuilder(
                        animation: opponentAnimationController,
                        child: Image.asset(enemiesImageSrcs[GameController.getEnemyIndex()]),
                        builder: (context, widget) => Transform.translate(
                          offset: Offset(0, shake(opponentAnimationController.value) * 20),
                          child: widget,
                        ),
                      ),
                    ),
                  ],
                ),

                // Enemy Stats
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(AssetsConstants.heartStatsImageSrc),
                          height: (ScreenConstants.screenHeight / 10),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(
                                AssetsConstants.numbersImage[enemiesStats[GameController.getEnemyIndex()][0]]),
                              height: (ScreenConstants.screenHeight / 12),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(AssetsConstants.enemyStatsImageSrc),
                          height: (ScreenConstants.screenHeight / 10),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image:
                            AssetImage(AssetsConstants.numbersImage[enemiesStats[GameController.getEnemyIndex()][1]]),
                              height: (ScreenConstants.screenHeight / 12),),
                          ],
                        )
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 15,)
              ],
            ),
          ]
        ),
      ],
    );
  }

  _cornerContainer (Quadrants quad, Color background, {String? imageSrc}) {
    if (imageSrc == null) {
      quad = Quadrants.BOTTOM_RIGHT;
    }
    switch(quad) {
      case Quadrants.TOP_LEFT:
      case Quadrants.TOP_RIGHT:
        return Container(
          height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
          width: (ScreenConstants.screenWidth / 2),
          color: background,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: (ScreenConstants.screenHeight / 35),),
              Image(image: AssetImage(imageSrc!),
                  height: (ScreenConstants.screenHeight / 6)),
            ],
          ),
        );

      case Quadrants.BOTTOM_LEFT:
      case Quadrants.BOTTOM_RIGHT:
        return Container(
          height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
          width: (ScreenConstants.screenWidth / 2),
          color: background,);
    }
  }
  _backgroundWidget (Color heroBgColor, Color enemyColor) {
    return Column(
      children: [
        Row(
          children: [
            _cornerContainer (Quadrants.TOP_LEFT, heroBgColor,
                imageSrc: AssetsConstants.playImageSrc),
            _cornerContainer (Quadrants.TOP_RIGHT, enemyColor,
                imageSrc: AssetsConstants.autoplayImageSrc),
          ],
        ),
        Row(
          children: [
            _cornerContainer (Quadrants.BOTTOM_LEFT, heroBgColor),
            _cornerContainer (Quadrants.BOTTOM_RIGHT, enemyColor),
          ],
        ),
      ],
    );
  }

  _addButtons(String heroAudio, String enemyAudio) {
    return Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Audio.play(AssetsConstants.audioPlay, audioVoiceType: true),
                onDoubleTap: () {
                  if (!GameController.isAutoplay()) {
                    _play();
                  }
                },
                child:
                  SizedBox(
                  height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),),
              ),
              InkWell(
                onTap: () => Audio.play(AssetsConstants.audioAutoPlay, audioVoiceType: true),
                onDoubleTap: () {
                  Audio.play(AssetsConstants.audioComingSoon, audioVoiceType: true);
                  // GameController.setAutoplay(!GameController.isAutoplay());
                  // if (GameController.isAutoplay()){
                  //   _play();
                  // }
                },
                child:
                  SizedBox(
                  height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () => Audio.play(heroAudio, audioVoiceType: true),
                onDoubleTap: () async {
                  Elements element = GameController.getHeroFighters()[GameController.getHeroIndex()]!.getCharacter()!.getElement();
                  List<String> audioAssets = [
                    AssetsConstants.audioLife[heroesStats[GameController.getHeroIndex()][0]],
                    AssetsConstants.audioForce[heroesStats[GameController.getHeroIndex()][1]],
                    AssetsConstants.audioElements[element]!];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                  child:
                  SizedBox(
                    height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                    width: (ScreenConstants.screenWidth / 2),)
              ),
              InkWell(
                onTap: () => Audio.play(enemyAudio, audioVoiceType: true),
                onDoubleTap: () {
                  Elements element = GameController.getHeroOpponents()[GameController.getEnemyIndex()]!.getCharacter()!.getElement();
                  List<String> audioAssets = [
                    AssetsConstants.audioLife[enemiesStats[GameController.getEnemyIndex()][0]],
                    AssetsConstants.audioForce[enemiesStats[GameController.getEnemyIndex()][1]],
                    AssetsConstants.audioElements[element]!];
                  Audio.waitingToPlay(audioAssets, audioVoiceType: true);
                },
                child:
                  SizedBox(
                  height: ((ScreenConstants.screenHeight - ScreenConstants.screenBarHeight) / 2),
                  width: (ScreenConstants.screenWidth / 2),),
              )],
          ),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {

    if (GameController.isAutoplay()){
      _play();
    }

    return Scaffold(
      appBar:
          WidgetBuilderFunctions.appBar(
              Screens.FIGHT_PAGE, ScreenConstants.fightPageTitle),
      body:
      SizedBox.expand(child:
        GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) async {
      // Page forwards
      if (dragEndDetails.primaryVelocity! < 0) {
        if (!GameController.isAutoplay()){
          _play();
        }
      }
      // Page backwards
      else if (dragEndDetails.primaryVelocity! > 0) {
        Audio.play(AssetsConstants.audioLeftGame, audioVoiceType: true);
        Navigator.pop(context);
      }
    },
    child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: <Widget>[
              _backgroundWidget(heroesColors[GameController.getHeroIndex()],
                  enemiesColors[GameController.getEnemyIndex()]),
              _combatWidget(context),
              _addButtons(
                  AssetsConstants.heroesAudio[GameController.getHeroFighters()[GameController.getHeroIndex()]!.getHero()]!,
                  AssetsConstants.heroesAudio[GameController.getHeroOpponents()[GameController.getEnemyIndex()]!.getHero()]!),
            ],
          );
        },
      ),
    )));
  }


}