import "package:flutter/material.dart";

import '../../change_page.dart';
import '../../constants/screen_constants.dart';
import '../../widget_builder.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();

}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
        WidgetBuilderFunctions.appBar(Screens.ACCOUNT_PAGE,
            ScreenConstants.accountPageTitle),
        body:
        SizedBox.expand(child:
        GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // Page forwards
            if (dragEndDetails.primaryVelocity! < 0) {}
            // Page backwards
            else if (dragEndDetails.primaryVelocity! > 0) {
              ChangePage.toDefinitionsPage(context);
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