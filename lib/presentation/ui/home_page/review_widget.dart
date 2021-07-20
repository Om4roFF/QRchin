import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrching/presentation/utilities/tooltip_widget.dart';
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
                  child: Text(
                    'Розыгрыши',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
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

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: MyTooltip(
                    message: 'Номер розыгрыш',
                    child: Text('№'),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: MyTooltip(
                    message:
                    'Страница или канал спонсора, где находится QR-код',
                    child: Text('Сайт'),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: MyTooltip(
                    message: 'Бюджет розыгрыша',
                    child: Text('Бюджет'),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: MyTooltip(
                    message: 'Количество денежных призов розыгрыша',
                    child: Text('Призы'),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 13, right: 13, top: 10),
                  child: GestureDetector(
                    onTap: () => _launchURL('https://youtube.com'),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Tooltip(
                              message: '${index + 1}',
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(229, 229, 229, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Tooltip(
                                    message: 'www.youtube',
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Vector",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "www.youtube.com",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Tooltip(
                              message: '145\$',
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 10),
                                child: Text(
                                  '145\$',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.2,
                            width: 30,
                            indent: 15,
                            endIndent: 15,
                            color: Colors.grey,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
