import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../change_page.dart';
import '../../constants/assets_constants.dart';
import '../../constants/screen_constants.dart';
import '../../database/user.dart';
import '../../widget_builder.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({Key? key}) : super(key: key);

  @override
  _BattlePageState createState() => _BattlePageState();

}

class _BattlePageState extends State<BattlePage> {

  @override
  Widget build(BuildContext context) {

    _getChapterEnemies();

    User user = GameController.getUser();
    String chapter = user.getUserChapter()!.toString();
    String part =    user.getUserPart()!.toString();
    String chapterTitle = "${ScreenConstants.battlePageTitle} $chapter-$part";

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.BATTLE_PAGE, chapterTitle,
            specificAudio: AssetsConstants.audioChapter[int.parse(part)]),
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
              ChangePage.toMainPage(context);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  WidgetBuilderFunctions.quadrantsWidget(context,
                      ScreenConstants.battlePageScreens, ScreenConstants.battlePageTitles,
                      ScreenConstants.battlePageImageSrcs, ScreenConstants.battlePageColors,
                      hasHeroImage: true),
                ],
              );
            },
          ),
        )));
  }

  _getChapterEnemies() async {
    await GameController.chapterEnemies();
  }
}