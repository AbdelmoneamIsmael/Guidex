/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Delete.svg
  String get delete => 'assets/icons/Delete.svg';

  /// File path: assets/icons/Google.svg
  String get google => 'assets/icons/Google.svg';

  /// File path: assets/icons/QR.svg
  String get qr => 'assets/icons/QR.svg';

  /// File path: assets/icons/app_logo.svg
  String get appLogo => 'assets/icons/app_logo.svg';

  /// File path: assets/icons/cart.svg
  String get cart => 'assets/icons/cart.svg';

  /// File path: assets/icons/community.svg
  String get community => 'assets/icons/community.svg';

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/flash.svg
  String get flash => 'assets/icons/flash.svg';

  /// File path: assets/icons/lock_window.svg
  String get lockWindow => 'assets/icons/lock_window.svg';

  /// File path: assets/icons/qrcod.svg
  String get qrcod => 'assets/icons/qrcod.svg';

  /// File path: assets/icons/refresh.svg
  String get refresh => 'assets/icons/refresh.svg';

  /// File path: assets/icons/remove-slash.svg
  String get removeSlash => 'assets/icons/remove-slash.svg';

  /// File path: assets/icons/scan code border.svg
  String get scanCodeBorder => 'assets/icons/scan code border.svg';

  /// File path: assets/icons/scanner.svg
  String get scanner => 'assets/icons/scanner.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/unlock_window.svg
  String get unlockWindow => 'assets/icons/unlock_window.svg';

  /// File path: assets/icons/user.svg
  String get user => 'assets/icons/user.svg';

  /// List of all assets
  List<String> get values => [
        delete,
        google,
        qr,
        appLogo,
        cart,
        community,
        facebook,
        flash,
        lockWindow,
        qrcod,
        refresh,
        removeSlash,
        scanCodeBorder,
        scanner,
        search,
        unlockWindow,
        user
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onBoarding2.png
  AssetGenImage get onBoarding2 =>
      const AssetGenImage('assets/images/onBoarding2.png');

  /// File path: assets/images/onboarding.png
  AssetGenImage get onboarding =>
      const AssetGenImage('assets/images/onboarding.png');

  /// File path: assets/images/qrcode.png
  AssetGenImage get qrcode => const AssetGenImage('assets/images/qrcode.png');

  /// List of all assets
  List<AssetGenImage> get values => [onBoarding2, onboarding, qrcode];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
