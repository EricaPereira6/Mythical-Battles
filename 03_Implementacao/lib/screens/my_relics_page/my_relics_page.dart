import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/widget_builder.dart';

import '../../audio.dart';
import '../../change_page.dart';
import '../../constants/assets_constants.dart';
import '../../constants/db_constants.dart';
import '../../constants/screen_constants.dart';
import '../../database/hero.dart';
import '../../database/relic.dart';
import '../../game_controller.dart';

class MyRelicsPage extends StatefulWidget {
  const MyRelicsPage({Key? key}) : super(key: key);

  @override
  _MyRelicsPageState createState() => _MyRelicsPageState();

}

class _MyRelicsPageState extends State<MyRelicsPage> {

  List<Relic> myRelics = GameController.getUser().getMyRelics()!;
  List<Relic> relics = [];

  int index = ScreenConstants.pageIndex;

  @override
  Widget build(BuildContext context) {

    _updateRelics();

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.MY_RELICS_PAGE,
            ScreenConstants.myRelicsPageTitle),
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
              ChangePage.toBagPage(context);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  WidgetBuilderFunctions.relicsQuadrants(context, relics),
                ],
              );
            },
          ),
        )));
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
