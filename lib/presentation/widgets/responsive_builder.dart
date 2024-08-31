import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:practice_one/presentation/utils/screen_utils.dart';

class Responsive_builder extends StatelessWidget {
  Responsive_builder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceType devicetype = ScreenUtils.getDeviceType(size.width);

    if (devicetype == DeviceType.mobile)
      return mobile;
    else if (devicetype == DeviceType.tablet) return tablet;

    return desktop;
  }
}
