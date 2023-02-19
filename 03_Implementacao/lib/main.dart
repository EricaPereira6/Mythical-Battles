import 'package:flutter/material.dart';

import 'Initializer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(const MaterialApp(
      home: Initializer()
  ));
}
