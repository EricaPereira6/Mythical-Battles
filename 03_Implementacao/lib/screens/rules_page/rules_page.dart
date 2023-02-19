import "package:flutter/material.dart";
import 'package:mythical_battles_project_65/constants/screen_constants.dart';
import 'package:mythical_battles_project_65/widget_builder.dart';

import '../../change_page.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  _RulesPageState createState() => _RulesPageState();

}

class _RulesPageState extends State<RulesPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.RULES_PAGE,
            ScreenConstants.rulesPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ChangePage.toBattlePage(context);
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