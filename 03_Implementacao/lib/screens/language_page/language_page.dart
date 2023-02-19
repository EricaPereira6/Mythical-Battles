import "package:flutter/material.dart";

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();

}

class _LanguagePageState extends State<LanguagePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.LANGUAGE_PAGE,
            ScreenConstants.languagePageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ChangePage.toAudioPage(context);
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