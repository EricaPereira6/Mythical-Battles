import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/change_page.dart';

import '../../audio.dart';
import '../../constants/assets_constants.dart';
import '../../constants/db_constants.dart';
import '../../constants/screen_constants.dart';
import '../../database/hero.dart';
import '../../widget_builder.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({Key? key}) : super(key: key);

  @override
  _HeroesPageState createState() => _HeroesPageState();

}

class _HeroesPageState extends State<HeroesPage> {

  List<Heroes> allHeroes = Heroes.values;
  List<Her0> heroes = [];
  int index = ScreenConstants.pageIndex;

  @override
  Widget build(BuildContext context) {

    _updateHeroes();

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.HEROES_PAGE,
            ScreenConstants.heroesPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          // Using the DragEndDetails allows us to only fire once per swipe.
          onVerticalDragEnd: (dragEndDetails) async {
            // Swipe Up
            if (dragEndDetails.primaryVelocity! < 0) {
              index = ScreenConstants.updateIndex(true, allHeroes.length - 1, index);
              _refresh(context);
            }
            // Swipe Down
            else if (dragEndDetails.primaryVelocity! > 0) {
              index = ScreenConstants.updateIndex(false, allHeroes.length - 1, index);
              _refresh(context);
            }
          },
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ScreenConstants.pageIndex = 0;
              ChangePage.toBagPage(context);
            }
          },
          child:
          LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  WidgetBuilderFunctions.heroesQuadrants(context, heroes)
                ],
              );
            },
          ),
        )));
  }


  _updateHeroes() {
    heroes = [];
    for (int i = index; i < (index + 4); i++) {
      if (i < allHeroes.length){
        heroes.add(Her0("character${allHeroes[i]}",
            character: DBConstants.characters[allHeroes[i]]));
      }
    }
  }

  _refresh(context) {
    Audio.play(AssetsConstants.audioButton, audioVoiceType: false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));
  }
}