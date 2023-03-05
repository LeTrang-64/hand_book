/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $ResourcesGen {
  const $ResourcesGen();

  $ResourcesIconsGen get icons => const $ResourcesIconsGen();
}

class $ResourcesIconsGen {
  const $ResourcesIconsGen();

  /// File path: resources/icons/ic_16inline_clock_outlined.svg
  String get ic16inlineClockOutlined =>
      'resources/icons/ic_16inline_clock_outlined.svg';

  /// File path: resources/icons/ic_16inline_close_outlined.svg
  String get ic16inlineCloseOutlined =>
      'resources/icons/ic_16inline_close_outlined.svg';

  /// File path: resources/icons/ic_16inline_delivery_filled.svg
  String get ic16inlineDeliveryFilled =>
      'resources/icons/ic_16inline_delivery_filled.svg';

  /// File path: resources/icons/ic_16inline_minus_ink1.svg
  String get ic16inlineMinusInk1 =>
      'resources/icons/ic_16inline_minus_ink1.svg';

  /// File path: resources/icons/ic_24function_radio_check_checked.svg
  String get ic24functionRadioCheckChecked =>
      'resources/icons/ic_24function_radio_check_checked.svg';

  /// File path: resources/icons/ic_24function_radio_uncheck_checked.svg
  String get ic24functionRadioUncheckChecked =>
      'resources/icons/ic_24function_radio_uncheck_checked.svg';

  /// File path: resources/icons/ic_24system_alert_circle_ink1.svg
  String get ic24systemAlertCircleInk1 =>
      'resources/icons/ic_24system_alert_circle_ink1.svg';

  /// File path: resources/icons/ic_24system_alert_triangle_ink1.svg
  String get ic24systemAlertTriangleInk1 =>
      'resources/icons/ic_24system_alert_triangle_ink1.svg';

  /// File path: resources/icons/ic_24system_arrow_down.svg
  String get ic24systemArrowDown =>
      'resources/icons/ic_24system_arrow_down.svg';
}

class Assets {
  Assets._();

  static const $ResourcesGen resources = $ResourcesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
