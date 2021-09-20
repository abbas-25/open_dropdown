library open_dropdown;

import 'package:flutter/material.dart';

Future<void> openDropdown(GlobalKey key) async {
  try {
    await Future.delayed(
        Duration(
          milliseconds: 300,
        ),
        () {});

    if (key.currentContext != null) {
      final detector = findGestureDetector(key.currentContext!);

      if (detector != null) {
        if (detector.onTap != null) {
          detector.onTap!();
        } else {
          debugPrint(
              "ERROR openDropdown - onTap function on GestureDetector is null");
        }
      } else {
        debugPrint("ERROR openDropdown - GestureDetector not found with provided GlobalKey");
      }
    } else {
      debugPrint("ERROR openDropdown - Passed key has no current context");
    }
  } catch (exception) {
    debugPrint("Exception in openDropdown: $exception");
  }
}

GestureDetector? findGestureDetector(BuildContext context) {
  GestureDetector? detector;

  context.visitChildElements((element) {
    if (element.widget is GestureDetector) {
      detector = element.widget as GestureDetector;
      return;
    } else {
      findGestureDetector(element);
    }

    return;
  });

  return detector;
}
