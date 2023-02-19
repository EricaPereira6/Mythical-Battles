import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../database/hero.dart';
import '../../widget_builder.dart';

class ChoosePositionPage extends StatefulWidget {
  const ChoosePositionPage({Key? key}) : super(key: key);

  @override
  _ChoosePositionPageState createState() => _ChoosePositionPageState();

}

class _ChoosePositionPageState extends State<ChoosePositionPage> {

  List<Her0> heroes = [Her0.defaultHero(), Her0.defaultHero(), Her0.defaultHero(),
    Her0.defaultHero()];

  @override
  Widget build(BuildContext context) {

    _getHeroes();

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.CHOOSE_POSITION_PAGE,
            ScreenConstants.choosePositionPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
            onHorizontalDragEnd: (dragEndDetails) {
              // Page forwards
              if (dragEndDetails.primaryVelocity! < 0) {
                ChangePage.toFightPage(context);
              }
              // Page backwards
              else if (dragEndDetails.primaryVelocity! > 0) {
                ChangePage.toBattlePage(context);
              }
            },

            child: LayoutBuilder(
                builder: (context, constraint) {
                  return Stack(
                    children: <Widget>[
                      WidgetBuilderFunctions.heroesQuadrants(context, heroes, choosingPosition: true),
                    ],
                  );
                }
            )
        ))
    );
  }

  _getHeroes() {
    GameController.getHeroFighters().forEach((key, value) {
      heroes[key] = value;
    });
  }
}