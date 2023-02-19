import 'package:flutter/material.dart';
import '../../audio.dart';
import '../../constants/assets_constants.dart';

import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:
          WidgetBuilderFunctions.appBar(Screens.MAIN_PAGE,
              ScreenConstants.mainPageTitle),
        body:
        SizedBox.expand(child:
          GestureDetector(
            onVerticalDragEnd: (dragEndDetails) async {
              // Swipe Up
              if (dragEndDetails.primaryVelocity! < 0) {
                Audio.play(AssetsConstants.audioMagicButton, audioVoiceType: false);
                await showDialog(context: context, builder: (_) => const ImageReward());
              }
              // Swipe Down
              else if (dragEndDetails.primaryVelocity! > 0) {}
            },
            onHorizontalDragEnd: (dragEndDetails) {
              // Page forwards
              if (dragEndDetails.primaryVelocity! < 0) {}
              // Page backwards
              else if (dragEndDetails.primaryVelocity! > 0) {}
            },

            child: LayoutBuilder(
                builder: (context, constraint) {
                  return Stack(
                    children: <Widget>[
                      WidgetBuilderFunctions.quadrantsWidget(context,
                          ScreenConstants.mainPageScreens, ScreenConstants.mainPageTitles,
                          ScreenConstants.mainPageImageSrcs, ScreenConstants.mainPageColors),

                      WidgetBuilderFunctions.chestReward(context),

                    ],
                  );
                }
            )
        ))
    );
  }
}