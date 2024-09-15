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

  /// File path: assets/icons/Home.svg
  String get home => 'assets/icons/Home.svg';

  /// File path: assets/icons/cart.svg
  String get cart => 'assets/icons/cart.svg';

  /// File path: assets/icons/category.svg
  String get category => 'assets/icons/category.svg';

  /// File path: assets/icons/filter.svg
  String get filter => 'assets/icons/filter.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/map_marker.svg
  String get mapMarker => 'assets/icons/map_marker.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// List of all assets
  List<String> get values => [
        home,
        cart,
        category,
        filter,
        heart,
        location,
        mapMarker,
        profile,
        search,
        star
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/cleaning.png
  AssetGenImage get cleaning =>
      const AssetGenImage('assets/images/cleaning.png');

  /// File path: assets/images/ddeelly_logo.svg
  String get ddeellyLogo => 'assets/images/ddeelly_logo.svg';

  /// File path: assets/images/deal.png
  AssetGenImage get deal => const AssetGenImage('assets/images/deal.png');

  /// File path: assets/images/dinning.png
  AssetGenImage get dinning => const AssetGenImage('assets/images/dinning.png');

  /// File path: assets/images/entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('assets/images/entertainment.png');

  /// File path: assets/images/partner_al.png
  AssetGenImage get partnerAl =>
      const AssetGenImage('assets/images/partner_al.png');

  /// File path: assets/images/partner_bvlgari.png
  AssetGenImage get partnerBvlgari =>
      const AssetGenImage('assets/images/partner_bvlgari.png');

  /// File path: assets/images/partner_eau_zone.png
  AssetGenImage get partnerEauZone =>
      const AssetGenImage('assets/images/partner_eau_zone.png');

  /// File path: assets/images/partner_filia.png
  AssetGenImage get partnerFilia =>
      const AssetGenImage('assets/images/partner_filia.png');

  /// File path: assets/images/partner_nobu.png
  AssetGenImage get partnerNobu =>
      const AssetGenImage('assets/images/partner_nobu.png');

  /// File path: assets/images/partner_sstay_dubai.png
  AssetGenImage get partnerSstayDubai =>
      const AssetGenImage('assets/images/partner_sstay_dubai.png');

  /// File path: assets/images/salon_spa.png
  AssetGenImage get salonSpa =>
      const AssetGenImage('assets/images/salon_spa.png');

  /// List of all assets
  List<dynamic> get values => [
        banner,
        cleaning,
        ddeellyLogo,
        deal,
        dinning,
        entertainment,
        partnerAl,
        partnerBvlgari,
        partnerEauZone,
        partnerFilia,
        partnerNobu,
        partnerSstayDubai,
        salonSpa
      ];
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
