import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrching/domain/model/history.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryViewPage extends StatelessWidget {
  final History? history;

  const HistoryViewPage({Key? key, required this.history}) : super(key: key);

  SnackBar _getSuccessSnackBar() {
    return SnackBar(
      content: Text('Ссылка успешно скопирована!'),
    );
  }

  SnackBar _getFailedSnackBar(String text) {
    return SnackBar(content: Text(text));
  }

  void _launchURL(context) async => await canLaunch(history!.url)
      ? await launch(history!.url)
      : ScaffoldMessenger.of(context).showSnackBar(
          _getFailedSnackBar('Не возможно открыть ссылку!'),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(expandedHeight: 300, history: history!),
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 140),
                child: SingleChildScrollView(
                  child: Card(
                    color: Theme.of(context).primaryColorLight,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.link),
                            color: const Color.fromRGBO(255, 191, 67, 1),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: history!.url),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(_getSuccessSnackBar());
                            },
                          ),
                          Expanded(
                            child: Text(history!.url),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                minimumSize: const Size(160, 50),
              ),
              onPressed: () => _launchURL(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Открыть в браузере",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                minimumSize: const Size(160, 50),
              ),
              onPressed: () async => await Share.share(history!.url),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Поделиться"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final History history;

  MySliverAppBar({required this.expandedHeight, required this.history});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        SizedBox(
          height: expandedHeight,
          width: double.infinity,
          child: ColoredBox(
            color: Theme.of(context).primaryColor,
          ),
        ),
        // Positioned(
        //   top: 30,
        //   left: 5,
        //   child: Image.asset(
        //     'assets/images/main-4.png',
        //     fit: BoxFit.cover,
        //     color: Colors.green[900],
        //   ),
        // ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/main-4.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "История детально",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: const BackButton(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2.5 - shrinkOffset,
          left: (MediaQuery.of(context).size.width - expandedHeight) / 2,
          right: (MediaQuery.of(context).size.width - expandedHeight) / 2,
          child: Center(
            child: Card(
              color: Theme.of(context).primaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide.none,
              ),
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: expandedHeight,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: QrImage(
                        size: double.infinity,
                        data: history.url,
                        version: QrVersions.auto,
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(history.date),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
