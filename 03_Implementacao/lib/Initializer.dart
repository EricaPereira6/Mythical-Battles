
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/assets_constants.dart';
import 'constants/screen_constants.dart';
import 'database/user.dart';
import 'game_controller.dart';
import 'change_page.dart';
import 'database/database_reference.dart';

class Initializer extends StatefulWidget {
  const Initializer({Key? key}) : super(key: key);

  @override
  _InitializerState createState() => _InitializerState();

}

class _InitializerState extends State<Initializer> {

  static bool ranOneTime = false;

  @override
  Widget build(BuildContext context) {

    //WidgetsBinding.instance.addPostFrameCallback((_) => _initializer(context));
    //SchedulerBinding.instance.addPostFrameCallback((_) {});
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (!ranOneTime) {
      ranOneTime = true;
      _initializeInitializer(context);
    }

    return Container(
      height: ScreenConstants.screenHeight,
      width:  ScreenConstants.screenWidth,
      decoration: const BoxDecoration(image: DecorationImage(
    image: AssetImage(AssetsConstants.loadingScreenImageSrc),
    fit: BoxFit.fill,),),);
  }

  _initializeInitializer(context) async {

    ScreenConstants.setScreenWidth(MediaQuery.of(context).size.width);
    ScreenConstants.setScreenHeight(MediaQuery.of(context).size.height);
    ScreenConstants.setBarHeight(AppBar().preferredSize.height);

    // GameConstants.setScreenWidth(MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio);
    // GameConstants.setScreenHeight(MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio);

    await DatabaseReference.initialize();

    String deviceId = await GameController.generatePhoneId();

    GameController.setUser(await DatabaseReference.getUserData(deviceId));
    // GameConstants.user = await DatabaseReference.getUserData(deviceId);

    User user = GameController.getUser();

    int? level = user.getUserLevel();
    GameController.setRewards(await DatabaseReference.getRewardsLevel(level!));
    // GameConstants.rewards = await DatabaseReference.getRewardsLevel(level!);

    //await DatabaseReference.delete(GameConstants.userHeroTableName, GameConstants.userHeroUserCol, userId);

    String userId = user.getUserId();
    var heroes = await DatabaseReference.getMyHeroes(userId);
    GameController.user.addMyHeroesFromMap(heroes);

    var relics = await DatabaseReference.getMyRelics(userId);
    GameController.user.addMyRelicsFromMap(relics);

    if(kDebugMode) {
      print(" ${AppBar().preferredSize.height}");
      //print(GameConstants.rewards.getTimeLimit().hour);
      // print("--------------accessibleNavigation------------- ${MediaQuery.of(context).accessibleNavigation}");
    }

    ChangePage.toMainPage(context);
  }
}

