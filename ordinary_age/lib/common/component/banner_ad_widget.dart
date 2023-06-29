import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late final BannerAd banner;

  @override
  void initState() {
    super.initState();

    // 테스트용 광고
    // final adUnitId = Platform.isIOS
    //     ? 'ca-app-pub-3940256099942544/2934735716'
    //     : 'ca-app-pub-3940256099942544/6300978111';

    // 실제 광고
    final adUnitId = Platform.isIOS
        ? 'ca-app-pub-8026751002061219/4700593804'
        : 'ca-app-pub-8026751002061219/6099050350';

    banner = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      listener: BannerAdListener(onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: AdRequest(),
    );

    banner.load();
  }

  @override
  void dispose() {
    banner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: AdWidget(
        ad: banner,
      ),
    );
  }
}
