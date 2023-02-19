import 'dart:math';

import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../audio.dart';
import '../../change_page.dart';
import '../../constants/assets_constants.dart';
import '../../constants/screen_constants.dart';
import '../../database/hero.dart';
import '../../widget_builder.dart';

class MyHeroesPage extends StatefulWidget {
  const MyHeroesPage({Key? key}) : super(key: key);

  @override
  _MyHeroesPageState createState() => _MyHeroesPageState();

}

class _MyHeroesPageState extends State<MyHeroesPage> {

  List<Her0> myHeroes = GameController.getUser().getMyHeroes()!;
  List<Her0> heroes = [];

  int index = ScreenConstants.pageIndex;

  @override
  Widget build(BuildContext context) {

    _updateHeroes();

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.MY_HEROES_PAGE,
            ScreenConstants.myHeroesPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          // Using the DragEndDetails allows us to only fire once per swipe.
          onVerticalDragEnd: (dragEndDetails) async {
            // Swipe Up
            if (dragEndDetails.primaryVelocity! < 0) {
              index = ScreenConstants.updateIndex(true, myHeroes.length, index);
              _refresh(context);
            }
            // Swipe Down
            else if (dragEndDetails.primaryVelocity! > 0) {
              index = ScreenConstants.updateIndex(false, myHeroes.length, index);
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
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  WidgetBuilderFunctions.heroesQuadrants(context, heroes,
                      isMyHeroes: true)
                ],
              );
            },
          ),
        )));
  }

  _updateHeroes() {
    heroes = [];
    for (int i = index; i < (index + 4); i++) {
      if (i < myHeroes.length){
        heroes.add(myHeroes[i]);
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