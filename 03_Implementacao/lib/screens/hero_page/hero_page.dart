import 'package:flutter/material.dart';
import 'package:mythical_battles_project_65/change_page.dart';
import 'package:mythical_battles_project_65/database/hero.dart';
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../audio.dart';
import '../../constants/assets_constants.dart';
import '../../constants/db_constants.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  _HeroPageState createState() => _HeroPageState();

}

class _HeroPageState extends State<HeroPage> with SingleTickerProviderStateMixin {

  late AnimationController myAnimationController;

  @override
  void initState() {
    super.initState();
    myAnimationController = AnimationController(duration: const Duration(seconds: 1),
        vsync: this)..forward()..addListener(() {
      if (myAnimationController.isCompleted) {
        myAnimationController.repeat();
      }
    });
  }
  /// convert 0-1 to 0-1-0
  double shake(double value) =>
      3 * (0.5 - (0.5 - (value * 1)).abs());

  @override
  Widget build(BuildContext context) {

    Her0 hero = GameController.getCurrentHeroPage();

    ScreenConstants.pageIndex = 0;

    Relics r = hero.getRelic() != null ? hero.getRelic()!.getRelic() : Relics.DEFAULT_RELIC;
    String relic = (hero.getRelic() != null) ? AssetsConstants.relicsImageSrcs[r]! : "";

    List<String> heroPageImageSrcs = [
      AssetsConstants.elementsImageSrcs[hero.getCharacter()?.getElement()]!,
      "",
      relic,
      AssetsConstants.elementsImageSrcs[hero.getCharacter()?.getElement()]!];

    List<Color> heroPageColors = [
      AssetsConstants.noScreenColor,
      AssetsConstants.noScreenColor,
      AssetsConstants.noScreenColor,
      AssetsConstants.noScreenColor];

    List<String> heroPageTitles = ["Estatísticas", "História",
      "Mais\nstatísticas", "Poder\nEspecial"];
    List<String> myHeroPageTitles = ["Estatísticas", "História",
      "Equipar\nRelíquia", "Fundir\nHerói"];

    List<Screens> heroPageScreens = [Screens.DEFAULT_PAGE, Screens.DEFAULT_PAGE,
      Screens.DEFAULT_PAGE, Screens.DEFAULT_PAGE];


    String? heroName = hero.getCharacter()?.getName();

    return Scaffold(
      appBar:
      WidgetBuilderFunctions.appBar(Screens.HERO_PAGE, heroName!,
          specificAudio: AssetsConstants.heroesAudio[hero.getHero()]),
      body:
      SizedBox.expand(child:
        GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
      // Page forwards
      if (dragEndDetails.primaryVelocity! < 0) {}
      // Page backwards
      else if (dragEndDetails.primaryVelocity! > 0) {
        Audio.play(AssetsConstants.audioButton, audioVoiceType: false);
        myAnimationController.stop();
        if (GameController.isMyHeroPage()) {
          ChangePage.toMyHeroesPage(context);
        }
        else {
          ChangePage.toHeroesPage(context);
        }
        // Navigator.pop(context);
      }
    },
    child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: <Widget>[
              WidgetBuilderFunctions.quadrantsWidget(context, heroPageScreens,
                  GameController.isMyHeroPage()? myHeroPageTitles : heroPageTitles,
                  heroPageImageSrcs, heroPageColors, isHeroPage: true),

              // WidgetBuilderFunctions.centerHero(context),
              _centerHero(context),

              WidgetBuilderFunctions.quadrantsButtons (context,
                  isMyHeroPage: GameController.isMyHeroPage()),

              WidgetBuilderFunctions.centerHeroButton(context),
            ],
          );
        },
      ),
    )));
  }

  _centerHero(context){

    Her0 hero = GameController.getCurrentHeroPage();
    String heroImageSrc = AssetsConstants.heroesImageSrcs[hero.getHero()]!;

    return SizedBox(
        width: ScreenConstants.screenWidth,
        height: ScreenConstants.screenHeight,
        child:
        Stack(
          children: [
            Center(child:
              SizedBox(
                height: (ScreenConstants.screenHeight / 1.65),
                  child: AnimatedBuilder(
                    animation: myAnimationController,
                    child: Image.asset(heroImageSrc),
                    builder: (context, widget) => Transform.translate(
                      offset: Offset(0, shake(myAnimationController.value) * 20),
                      child: widget,
                    ),
                  ),
                ),),
          ],
        )
    );
  }


  @override
  void dispose() {
    myAnimationController.dispose();
    super.dispose();
  }
}