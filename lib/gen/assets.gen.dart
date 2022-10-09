/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  $LibI18nGen get i18n => const $LibI18nGen();
}

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/double_tap_animation.json
  String get doubleTapAnimation => 'assets/animation/double_tap_animation.json';

  /// File path: assets/animation/double_tap_animation_white.json
  String get doubleTapAnimationWhite =>
      'assets/animation/double_tap_animation_white.json';

  /// List of all assets
  List<String> get values => [doubleTapAnimation, doubleTapAnimationWhite];
}

class $AssetsMockDataGen {
  const $AssetsMockDataGen();

  /// File path: assets/mock_data/moments_local_data.json
  String get momentsLocalData => 'assets/mock_data/moments_local_data.json';

  /// List of all assets
  List<String> get values => [momentsLocalData];
}

class $LibI18nGen {
  const $LibI18nGen();

  /// File path: lib/i18n/strings.g.dart
  String get stringsG => 'lib/i18n/strings.g.dart';

  /// File path: lib/i18n/strings.i18n.json
  String get stringsI18n => 'lib/i18n/strings.i18n.json';

  /// File path: lib/i18n/strings_pl.i18n.json
  String get stringsPlI18n => 'lib/i18n/strings_pl.i18n.json';

  /// List of all assets
  List<String> get values => [stringsG, stringsI18n, stringsPlI18n];
}

class Assets {
  Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsMockDataGen mockData = $AssetsMockDataGen();
  static const $LibGen lib = $LibGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
