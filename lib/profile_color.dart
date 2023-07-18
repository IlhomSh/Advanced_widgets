import 'package:flutter/material.dart';

class ProfileColor extends InheritedWidget {
  final Color mainColor;

  const ProfileColor({
    Key? key,
    required this.mainColor,
    required Widget child,
  }) : super(key: key, child: child);

  static ProfileColor? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileColor>();
  }

  @override
  bool updateShouldNotify(ProfileColor oldWidget) {
    return mainColor != oldWidget.mainColor;
  }
}

