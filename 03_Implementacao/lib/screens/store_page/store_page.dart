import "package:flutter/material.dart";

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();

}

class _StorePageState extends State<StorePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.STORE_PAGE,
            ScreenConstants.storePageTitle),
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
                  WidgetBuilderFunctions.comingSoonWidget(),
                ],
              );
            },
          ),
        )));

  }
}