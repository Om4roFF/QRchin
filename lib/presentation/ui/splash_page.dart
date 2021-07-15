import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:qrching/generated/l10n.dart';
import 'home_page/home_page.dart';
import 'introduction_page/introduction_page.dart';

class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  late VideoPlayerController? _controller;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    final isClient = await Application.isClient();
    Locale myLocale = Localizations.localeOf(context);
    setLang(context, myLocale.languageCode);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => isClient ? HomePage() : IntroductionPage(),
      ),
    );
  }

  void setLang(BuildContext context, String locale) {
    S.load(Locale(locale));
    Provider.of<ApplicationProvider>(context, listen: false).setLang(locale);
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
    startTime();
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
          height: 1520,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
}
