import "package:flutter/material.dart";

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class OtherItemsPage extends StatefulWidget {
  const OtherItemsPage({Key? key}) : super(key: key);

  @override
  _OtherItemsPageState createState() => _OtherItemsPageState();

}

class _OtherItemsPageState extends State<OtherItemsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.OTHER_ITEMS_PAGE,
            ScreenConstants.otherItemsPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ChangePage.toBagPage(context);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  WidgetBuilderFunctions.comingSoonWidget(),
                ],
              );
            },
          ),
        )));
  }
}