
import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/game_controller.dart';

import '../../change_page.dart';
import '../../constants/assets_constants.dart';
import '../../constants/screen_constants.dart';


class BattleResultPage extends StatefulWidget {
  const BattleResultPage({Key? key}) : super(key: key);

  @override
  _BattleResultPageState createState() => _BattleResultPageState();
}

class _BattleResultPageState extends State<BattleResultPage> {

  static result(context){
    return SizedBox( width: ScreenConstants.screenWidth, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        SizedBox(height:
        (ScreenConstants.screenWidth / (GameController.hasWon()? 6 : 3)),),
        InkWell(
          onTap: ()  {
            ChangePage.toMainPage(context);
          },
          child:
          Image(image:
          AssetImage(AssetsConstants.resultImageSrcs[GameController.hasWon()]!),
            width: (ScreenConstants.screenWidth),),
        )
      ],
    ));
  }

  combatCornerContainer (Quadrants quad, Color background,
      String title, {String? imageSrc}) {
    if (!GameController.hasWon() || imageSrc == null) {
      quad = Quadrants.BOTTOM_RIGHT;
    }
    switch(quad) {
      case Quadrants.TOP_LEFT:
      case Quadrants.TOP_RIGHT:
      return Container(
        height: ((ScreenConstants.screenHeight) / 2),
        width: (ScreenConstants.screenWidth / 2),
        color: background,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: (ScreenConstants.screenWidth / 6),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Image(
                      image: const AssetImage(AssetsConstants.rewardsFrameImageSrc),
                      width: (ScreenConstants.screenWidth / 3),
                      height: (ScreenConstants.screenHeight/ 4.5),
                      fit: BoxFit.fill),
                  Column(
                    children: [
                      Image(image: AssetImage(imageSrc!), width: (ScreenConstants.screenWidth / 3),),
                      Center(
                          child: Text(title,
                            style: const TextStyle(color: Colors.white,
                                fontSize: ScreenConstants.resultTextSize,
                                fontWeight: FontWeight.bold, backgroundColor: Colors.black),
                            textAlign: TextAlign.center,)),
                    ],
                  ),
                ],),
              ],
            ),

          ],
        ),
      );
      case Quadrants.BOTTOM_LEFT:
        return Container(
            height: ((ScreenConstants.screenHeight) / 2),
            width: (ScreenConstants.screenWidth / 2),
            color: background,
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Image(
                            image: const AssetImage(AssetsConstants.rewardsFrameImageSrc),
                            width: (ScreenConstants.screenWidth / 3),
                            height: (ScreenConstants.screenHeight/ 4.5),
                            fit: BoxFit.fill),
                        Column(
                          children: [
                            Image(image: AssetImage(imageSrc!),
                              width: (ScreenConstants.screenWidth / 3),),
                            Center(
                                child: Text(title,
                                  style: const TextStyle(color: Colors.white,
                                      fontSize: ScreenConstants.resultTextSize,
                                      fontWeight: FontWeight.bold, backgroundColor: Colors.black),
                                  textAlign: TextAlign.center,)),
                          ],
                        ),
                      ],),
                    ],
                  ),
                  SizedBox(height: (ScreenConstants.screenWidth / 7),),
                ]
            )
        );

      case Quadrants.BOTTOM_RIGHT:
        return Container(
          height: ((ScreenConstants.screenHeight) / 2),
          width: (ScreenConstants.screenWidth / 2),
          color: background,);
    }
  }

  backgroundWidget (constraint, context, Color color) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => ChangePage.toMainPage(context),
              child:
              combatCornerContainer (Quadrants.TOP_LEFT,
                  color, "10 gems", imageSrc: AssetsConstants.gemImageScr),
            ),
            InkWell(
              onTap: () => ChangePage.toMainPage(context),
              child:
              combatCornerContainer (Quadrants.TOP_RIGHT,
                  color, "15 EXP", imageSrc: AssetsConstants.expImageScr),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () => ChangePage.toMainPage(context),
              child:
              combatCornerContainer (Quadrants.BOTTOM_LEFT,
                  color, "10 fusion", imageSrc: AssetsConstants.fusionImageScr),
            ),
            InkWell(
              onTap: () => ChangePage.toMainPage(context),
              child:
              combatCornerContainer (Quadrants.BOTTOM_RIGHT, color, ""),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: <Widget>[

              backgroundWidget(constraint, context,
                  AssetsConstants.resultColors[GameController.hasWon()]!),
              result(context),

            ],
          );
        },
      ),
    );

  }
}