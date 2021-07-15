import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({Key? key}) : super(key: key);

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
                    'Обзор',
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
                  child: Text('№'),
                  flex: 1,
                ),
                Expanded(
                  child: Text('Сайт'),
                  flex: 4,
                ),
                Expanded(
                  child: Text('Бюджет'),
                  flex: 2,
                ),
                Expanded(
                  child: Text('Призы'),
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
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.white.withOpacity(0.5),
                    //         spreadRadius: 1,
                    //         offset: Offset(0, 3),
                    //       ),
                    //     ]),

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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 10),
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Circle-icons-camera.svg/1200px-Circle-icons-camera.svg.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                                    color: Theme.of(context).primaryColor,
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
                );
              }),
        ],
      ),
    );
  }
}
