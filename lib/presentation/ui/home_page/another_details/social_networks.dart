import 'package:auto_size_text/auto_size_text.dart';
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
    final size = MediaQuery.of(context).size.width / 8;
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
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Facebook',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.youtube.com/c/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/YouTube.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'YouTube',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.instagram.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/instagram.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Instagram',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.tiktok.com/@qrching'),
                          child: Image.asset(
                            'assets/svg_logo/TikTok.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'TikTok',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.likee.video/@qrching'),
                          child: Image.asset(
                            'assets/svg_logo/likee.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Likee',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.pinterest.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Pinterest.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Pinterest',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL(
                              'https://www.snapchat.com/add/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Snapchat.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Snapchat',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.twitter.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Twitter.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Twitter',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL('https://www.reddit.com/r/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Reddit.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Reddit',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              _launchURL(
                                  'https://www.linkedin.com/company/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/Linkedin.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Linkedin',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('https://www.vk.com/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/VK.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'VK',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('https://ok.ru/qrching'),
                          child: Image.asset(
                            'assets/svg_logo/OK.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'OK',
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('https://qrching.tumblr.com'),
                          child: Image.asset(
                            'assets/svg_logo/Tumblr.png',
                            width: size,
                            height: size,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          'Tumblr',
                          maxLines: 1,
                          minFontSize: 14,
                          maxFontSize: 30,
                        ),
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
