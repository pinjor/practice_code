enum DeviceType { mobile, tablet, desktop }

class ScreenUtils {
  static const double MaxSizeMobile = 640;
  static const double MaxSizetablet = 1008;
  static const double MinSizedesktop = 1008;

  static DeviceType getDeviceType(double width) {
    if (width < ScreenUtils.MaxSizeMobile)
      return DeviceType.mobile;
    else if (width >= ScreenUtils.MaxSizeMobile &&
        width < ScreenUtils.MaxSizetablet)
      return DeviceType.tablet;
    else
      return DeviceType.desktop;
  }
}
