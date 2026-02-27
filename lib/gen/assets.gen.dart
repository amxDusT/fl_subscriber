/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  const Assets._();

  static const AssetGenImage adobe = AssetGenImage('assets/adobe.png');
  static const AssetGenImage amazon = AssetGenImage('assets/amazon.png');
  static const AssetGenImage apple = AssetGenImage('assets/apple.png');
  static const AssetGenImage chatgpt = AssetGenImage('assets/chatgpt.png');
  static const AssetGenImage chatgptDark = AssetGenImage(
    'assets/chatgpt_dark.png',
  );
  static const AssetGenImage copilot = AssetGenImage('assets/copilot.png');
  static const AssetGenImage copilotDark = AssetGenImage(
    'assets/copilot_dark.png',
  );
  static const AssetGenImage disney = AssetGenImage('assets/disney.png');
  static const AssetGenImage disneyDark = AssetGenImage(
    'assets/disney_dark.png',
  );
  static const AssetGenImage dropbox = AssetGenImage('assets/dropbox.png');
  static const AssetGenImage figma = AssetGenImage('assets/figma.png');
  static const AssetGenImage hbo = AssetGenImage('assets/hbo.png');
  static const AssetGenImage hulu = AssetGenImage('assets/hulu.png');
  static const AssetGenImage icloud = AssetGenImage('assets/icloud.png');
  static const AssetGenImage linkedin = AssetGenImage('assets/linkedin.png');
  static const AssetGenImage microsoft = AssetGenImage('assets/microsoft.png');
  static const AssetGenImage netflix = AssetGenImage('assets/netflix.png');
  static const AssetGenImage notion = AssetGenImage('assets/notion.png');
  static const AssetGenImage spotify = AssetGenImage('assets/spotify.png');
  static const AssetGenImage youtube = AssetGenImage('assets/youtube.png');

  /// List of all assets
  static List<AssetGenImage> get values => [
    adobe,
    amazon,
    apple,
    chatgpt,
    chatgptDark,
    copilot,
    copilotDark,
    disney,
    disneyDark,
    dropbox,
    figma,
    hbo,
    hulu,
    icloud,
    linkedin,
    microsoft,
    netflix,
    notion,
    spotify,
    youtube,
  ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
