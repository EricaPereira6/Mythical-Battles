import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../database/hero.dart';
import '../../widget_builder.dart';


class OpponentsPage extends StatefulWidget {
  const OpponentsPage({Key? key}) : super(key: key);

  @override
  _OpponentsPageState createState() => _OpponentsPageState();

}

class _OpponentsPageState extends State<OpponentsPage> {

  List<Her0> heroes = [];

  @override
  Widget build(BuildContext context) {

    _getHeroes();

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.OPPONENTS_PAGE,
            ScreenConstants.opponentsPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ChangePage.toBattlePage(context);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  WidgetBuilderFunctions.heroesQuadrants(context, heroes, opponents: true)
                ],
              );
            },
          ),
        )));
  }

  _getHeroes() {
    for(int i = 0; i < GameController.getHeroOpponents().length; i++) {
      heroes.add(GameController.getHeroOpponents()[i]!);
    }
  }
}
