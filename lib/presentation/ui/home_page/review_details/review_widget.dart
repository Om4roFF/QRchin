import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: AutoSizeText(
                    'Розыгрыши',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
              ),
              _ReviewTable(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewTable extends StatelessWidget {
  final listOfColumns = [
    {
      "Number": "1",
      "Site": {
        "icon":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Circle-icons-camera.svg/1200px-Circle-icons-camera.svg.png",
        "name": "Instagram",
        "url": "www.youtube..com",
      },
      "budget": "172 \$ ",
      "prizes": 3
    },
    {
      "Number": "2",
      "Site": {
        "icon":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Circle-icons-camera.svg/1200px-Circle-icons-camera.svg.png",
        "name": "YouTube",
        "url": "www.youtube..com",
      },
      "budget": "172 \$ ",
      "prizes": 1
    },
    {
      "Number": "3",
      "Site": {
        "icon":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Circle-icons-camera.svg/1200px-Circle-icons-camera.svg.png",
        "name": "Facebook",
        "url": "www.youtube..com",
      },
      "budget": "172 \$ ",
      "prizes": 4
    },
  ];

  void _launchURL(String url) async {
    print('TAPPED');
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(4),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  '№',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Спонсор/Сайт',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Бюджет',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Призы',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                ),
              ),
            ],
          ),
          _buildTableRow(context,
              name: 'Vector Vector Vector Vector Vector Vector Vector Vector',
              url: 'youtube.com youtube.com youtube.com',
              budget: '175\$',
              prize: '3',
              number: '1'),
          _buildDivider(),
          _buildTableRow(context,
              name: 'Vector',
              url: 'youtube.com',
              budget: '175\$',
              prize: '3',
              number: '1'),
          _buildDivider(),
          _buildTableRow(context,
              name: 'Vector',
              url: 'youtube.com',
              budget: '175\$',
              prize: '3',
              number: '1'),
          _buildDivider(),
          _buildTableRow(context,
              name: 'Vector',
              url: 'youtube.com',
              budget: '175\$',
              prize: '3',
              number: '1'),
        ],
      ),
    );
  }

  TableRow _buildDivider() {
    return TableRow(children: [
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
    ]);
  }

  TableRow _buildTableRow(BuildContext context,
      {required String name,
        required String url,
        required String budget,
        required String prize,
        required String number}) {
    return TableRow(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme
            .of(context)
            .cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
          ),
        ],
      ),
      children: [
        TableRowInkWell(
          onTap: () => _launchURL('https://youtube.com'),
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TableRowInkWell(
            onTap: () => _launchURL('https://youtube.com'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  name,
                  minFontSize: 14,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                AutoSizeText(
                  url,
                  maxFontSize: 12,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TableRowInkWell(
                onTap: () => _launchURL('https://youtube.com'),
                child: AutoSizeText(
                  budget,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 20,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        TableRowInkWell(
          onTap: () => _launchURL('https://youtube.com'),
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  prize,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
