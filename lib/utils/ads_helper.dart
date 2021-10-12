import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class AdsHelper {

  AdsHelper(){
    this.loadAdmobInter();
  }

  //===================================> Admob Ads:
  //Admob Banner
  //// Admob App Id
  static String appId = 'ca-app-pub-8644958469423958~6081908645';
  // static String appId = 'ca-app-pub-3940256099942544~3347511713';

  static String admobBannerId_1 = 'ca-app-pub-8644958469423958/9638010276'; // test : ca-app-pub-3940256099942544/6300978111
 // static String admobBannerId_1 = 'ca-app-pub-3940256099942544/6300978111'; // test : ca-app-pub-3940256099942544/6300978111
  static String admobBannerId_2 = 'ca-app-pub-8644958469423958/9446438583';
 // static String admobBannerId_2 = 'ca-app-pub-3940256099942544/6300978111';

  //Admob Inter
  static String admobInterId_1 = 'ca-app-pub-8644958469423958/9446438583'; // test : ca-app-pub-3940256099942544/1033173712
 // static String admobInterId_1 = 'ca-app-pub-3940256099942544/1033173712'; // test : ca-app-pub-3940256099942544/1033173712
  static String admobInterId_2 = 'ca-app-pub-8644958469423958/8168698709';
 // static String admobInterId_2 = 'ca-app-pub-3940256099942544/1033173712';

  //Admob Native
  static String admobNativeId_1 = 'ca-app-pub-8644958469423958/5103212359'; // test : ca-app-pub-3940256099942544/2247696110
 // static String admobNativeId_1 = 'ca-app-pub-3940256099942544/2247696110'; // test : ca-app-pub-3940256099942544/2247696110
  static String admobNativeId_2 = 'ca-app-pub-8644958469423958/3530615542';
 // static String admobNativeId_2 = 'ca-app-pub-3940256099942544/2247696110';

  //Admob Reward
  // static String admobRewardId_1 = ''; // test : ca-app-pub-3940256099942544/5224354917
  // static String admobRewardId_1 = 'ca-app-pub-3940256099942544/5224354917'; // test : ca-app-pub-3940256099942544/5224354917
  // static String admobRewardId_1 = ''; // test : ca-app-pub-3940256099942544/5224354917
  // static String admobRewardId_2 = 'ca-app-pub-3940256099942544/5224354917'; // test : ca-app-pub-3940256099942544/5224354917

 static String testingId = 'a47d5108-ce0c-4f2b-bb22-d7eea19727cd'; //  My Real Device

  int loadInterAttempts = 0;

  Widget admobBannerAd; //Banners
  Widget admobNativeAd; //Natives
  //Interstitials
  AdmobInterstitial admobInterAd;

  static int adsFrequency = 20;
  bool isAdmobInterAdLoaded = false;

  static initAdmobAds() {
    Admob.initialize(testDeviceIds: [AdsHelper.testingId]);
  }

  loadAdmobInter() {
    Random r = new Random();
    bool id = r.nextBool();
    String admobInterId = id ? admobInterId_1 : admobInterId_2;
    admobInterAd = AdmobInterstitial(
      adUnitId: admobInterId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed || event == AdmobAdEvent.completed)
          admobInterAd.load();
        if (event == AdmobAdEvent.loaded) isAdmobInterAdLoaded = true;
        if (event == AdmobAdEvent.failedToLoad) {
          isAdmobInterAdLoaded = false;
          loadInterAttempts++;
          if (loadInterAttempts <= 1) {
            loadAdmobInter();
            print(
                '===========================> $loadInterAttempts attempts to load admob inter');
          }
        }
        print("===========================(Admob Inter)===> result : $event =====> args : $args");
      },
    );
    admobInterAd.load();
  }

  showAdmobInter({int probability, delay = 0}) {
    if (probability == null) probability = AdsHelper.adsFrequency;
    Random r = new Random();
    double falseProbability = (100 - probability) / 100;
    bool result = r.nextDouble() > falseProbability;
    if (isAdmobInterAdLoaded == true) {
      if (result) {
        Future.delayed(Duration(milliseconds: delay), () => admobInterAd.show());
        print('===========================(Admob Inter)===> Inter Ad is about to be Showen :D');
      }
      print('===========================(Admob Inter)===> Probablity of $probability% return ( $result )');
    } else {
      print("===========================(Admob Inter)===> Inter Ad not yet loaded!");
    }
  }

  Widget getAdmobBanner(AdmobBannerSize size) {
    Random r = new Random();
    bool id = r.nextBool();
    String admobBannerId = id ? admobBannerId_1 : admobBannerId_2;
    print('===========================(Admob Banner)===> Active with id : $admobBannerId');
    if (admobBannerAd == null) {
      admobBannerAd = Container(
        child: AdmobBanner(
          adUnitId: admobBannerId,
          adSize: size,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            print("===========================(Admob Banner)===> result : $event =====> $args");
            if (event == AdmobAdEvent.loaded) {
              // filled = true;
            }
          },
        ),
      );
    }
    return admobBannerAd;
  }

  disposeAllAds() {
    admobInterAd.dispose();
  }
}
