import 'dart:async';
import 'dart:developer';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/ui/home_page/home_page.dart';
import 'package:qrching/ui/introduction_page/introduction_page.dart';
import 'package:qrching/utilities/application.dart';
import 'package:video_player/video_player.dart';

class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  late VideoPlayerController? _controller;
  String? _locale;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    final isClient = await Application.isClient();
    setLang(context, _locale!);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => isClient
            ? HomePage()
            : IntroductionPage(
                locale: _locale,
              ),
      ),
    );
  }

  void setLang(BuildContext context, String locale) {
    if (locale == 'ru_RU') {
      S.load(Locale('ru'));
      Provider.of<ApplicationProvider>(context, listen: false).setLang('ru');
    } else if (locale == 'gr_GR') {
      S.load(Locale('gr'));
      Provider.of<ApplicationProvider>(context, listen: false).setLang('gr');
    } else {
      Provider.of<ApplicationProvider>(context, listen: false).setLang('en');
      S.load(Locale('ru'));
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/animation.mp4')
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller!.play();
        _controller!.setVolume(0.0);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
    initPlatformState();
    startTime();
  }

  Future<void> initPlatformState() async {
    String? currentLocale;
    try {
      currentLocale = await Devicelocale.currentLocale;
      print((currentLocale != null)
          ? currentLocale
          : "Unable to get currentLocale");
    } on PlatformException {
      print("Error obtaining current locale");
    }
    if (!mounted) return;
    setState(() {
      _locale = currentLocale;
    });
  }

  @override
  void dispose() {
    super.dispose();
    log('Disposed');
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 1080,
          height: 1920,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
}
