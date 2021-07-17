import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Provider.of<ApplicationProvider>(context, listen: false)
            .setNavigationMenuIndex(4);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Социальные сети'),
          leading: BackButton(
            onPressed: () {
              Provider.of<ApplicationProvider>(context, listen: false)
                  .setNavigationMenuIndex(4);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(245, 245, 245, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          'Подписывайся на наши каналы, чтобы не пропустить новые розыгрыши!'),
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () => _launchURL('https://youtube.com'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/facebook.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('Facebook'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () => _launchURL('https://youtube.com'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/youtube.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('YouTube'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () => _launchURL('https://youtube.com'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/instagram.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('Instagram'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () =>
                                _launchURL('https://qrching.com/ru/draws'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/tiktok.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('TikTok'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () =>
                                _launchURL('https://qrching.com/ru/draws'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/wechat.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('WeChat'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () =>
                                _launchURL('https://qrching.com/ru/draws'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/pinterest.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('Pinterest'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () =>
                                _launchURL('https://qrching.com/ru/draws'),
                            child: SvgPicture.asset(
                              'assets/svg_logo/snapchat.svg',
                              width: 50,
                              height: 50,
                            )),
                        Text('Snapchat'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://qrching.com/ru/draws'),
                          child: SvgPicture.asset(
                            'assets/svg_logo/twitter.svg',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Twitter'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
