import "package:flutter/material.dart";

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class DefinitionsPage extends StatefulWidget {
  const DefinitionsPage({Key? key}) : super(key: key);

  @override
  _DefinitionsPageState createState() => _DefinitionsPageState();

}

class _DefinitionsPageState extends State<DefinitionsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.DEFINITIONS_PAGE,
            ScreenConstants.definitionPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
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
                      ScreenConstants.definitionsPageScreens, ScreenConstants.definitionsPageTitles,
                      ScreenConstants.definitionsPageImageSrcs, ScreenConstants.definitionsPageColors,
                      hasImage: false),
                ],
              );
            },
          ),
        )));

  }
}