import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mythical_battles_project_65/game_controller.dart';

class Vibration {

  static Timer timer = Timer(const Duration(milliseconds: 0), () {});

  static lightVibration() {
    if (!GameController.muteVibration) {
      HapticFeedback.mediumImpact();
    }
  }
  static intenseVibration(int intensity, int millisDelay) {
    if (!GameController.muteVibration) {
      for (int i = 0; i < intensity; i++) {
        timer = Timer(Duration(milliseconds: (millisDelay * i)), () {
          lightVibration();
        });
      }
    }
  }
  static heartPattern(int beatNum) {
    if (!GameController.muteVibration) {
      for (int i = 0; i < beatNum; i++) {
        timer = Timer(Duration(milliseconds: (500 * i) + (200 * i)), () {
          lightVibration();
        });
        timer = Timer(Duration(milliseconds: (200 * (i + 1)) + (500 * i)), () {
          lightVibration();
        });
      }
    }
  }
}