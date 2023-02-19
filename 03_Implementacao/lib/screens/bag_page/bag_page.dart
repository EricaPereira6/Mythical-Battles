import "package:flutter/material.dart";

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  _BagPageState createState() => _BagPageState();

}

class _BagPageState extends State<BagPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.BAG_PAGE,
            ScreenConstants.bagPageTitle),
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
                      ScreenConstants.bagPageScreens, ScreenConstants.bagPageTitles,
                      ScreenConstants.bagPageImageSrcs, ScreenConstants.bagPageColors,
                      hasHeroImage: true)
                ],
              );
            },
          ),
        )));
  }
}