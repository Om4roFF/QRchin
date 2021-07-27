import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';
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
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                    content:
                        'Подписывайся на наши каналы, чтобы не пропустить новые розыгрыши!'),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () =>
                                _launchURL('https://www.facebook.com/qrching'),
                            child: Image.asset(
                              'assets/svg_logo/facebook.png',
                              width: 50,
                              height: 50,
                            )),
                        Text('Facebook'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.youtube.com/c/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/YouTube.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('YouTube'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.instagram.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/instagram.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Instagram'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.tiktok.com/@qrching'),
                          child: Image.asset(
                            'assets/svg_logo/TikTok.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('TikTok'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.likee.video/@qrching'),
                          child: Image.asset(
                            'assets/svg_logo/like.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Like'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.pinterest.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Pinterest.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Pinterest'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL(
                              'https://www.snapchat.com/add/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Snapchat.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Snapchat'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.twitter.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Twitter.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Twitter'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.reddit.com/r/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Reddit.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Reddit'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL(
                              'https://www.linkedin.com/company/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Linkedin.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Linkedin'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('https://www.vk.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/VK.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('VK'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('https://ok.ru/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/OK.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('OK'),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('https://qrching.tumblr.com'),
                          child: Image.asset(
                            'assets/svg_logo/Tumblr.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Text('Tumblr'),
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
