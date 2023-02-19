import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../audio.dart';
import '../../constants/assets_constants.dart';
import '../../constants/screen_constants.dart';
import '../../database/relic.dart';
import '../../widget_builder.dart';

class SelectRelicsPage extends StatefulWidget {
  const SelectRelicsPage({Key? key}) : super(key: key);

  @override
  _SelectRelicsPageState createState() => _SelectRelicsPageState();

}

class _SelectRelicsPageState extends State<SelectRelicsPage> {

  List<Relic> myRelics = GameController.getUser().getMyAvailableRelics()!;
  List<Relic> relics = [];

  int index = ScreenConstants.pageIndex;

  @override
  Widget build(BuildContext context) {

    _updateRelics();

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.EQUIP_PAGE,
            ScreenConstants.selectRelicPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          // Using the DragEndDetails allows us to only fire once per swipe.
            onVerticalDragEnd: (dragEndDetails) async {
              // Swipe Up
              if (dragEndDetails.primaryVelocity! < 0) {
                index = ScreenConstants.updateIndex(true, myRelics.length, index);
                _refresh(context);
              }
              // Swipe Down
              else if (dragEndDetails.primaryVelocity! > 0) {
                index = ScreenConstants.updateIndex(false, myRelics.length, index);
                _refresh(context);
              }
            },
            onHorizontalDragEnd: (dragEndDetails) {
              // Page forwards
              if (dragEndDetails.primaryVelocity! < 0) {}
              // Page backwards
              else if (dragEndDetails.primaryVelocity! > 0) {
                ScreenConstants.pageIndex = 0;
                Navigator.pop(context);
              }
            },

            child: LayoutBuilder(
                builder: (context, constraint) {
                  return Stack(
                    children: <Widget>[
                      WidgetBuilderFunctions.relicsQuadrants(context, relics,
                          equipRelic: true, hero: GameController.currentHeroPage),
                    ],
                  );
                }
            )
        ))
    );
  }

  _updateRelics() {
    relics = [];
    for (int i = index; i < (index + 4); i++) {
      if (i < myRelics.length){
        relics.add(myRelics[i]);
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