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
      child: DataTable(columnSpacing: 10, dividerThickness: 0, columns: [
        DataColumn(
          label: Text('№'),
        ),
        DataColumn(
          label: Text('Сайт'),
        ),
        DataColumn(
          label: Text('Бюджет'),
        ),
        DataColumn(
          label: Text('Призы'),
        ),
      ], rows: [
        DataRow(selected: false, cells: <DataCell>[
          DataCell(
            Text("1"),
          ),
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Circle-icons-camera.svg/1200px-Circle-icons-camera.svg.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Vector"),
                    Text("www.youtube.com"),
                  ],
                ),
              ],
            ),
          ),
          DataCell(
            Text("175\$"),
          ),
          DataCell(
            Text("3"),
          ),
        ]),
        DataRow(selected: false, cells: <DataCell>[
          DataCell(
            Text("1"),
          ),
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Circle-icons-camera.svg/1200px-Circle-icons-camera.svg.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Vector"),
                    Text("www.youtube.com"),
                  ],
                ),
              ],
            ),
          ),
          DataCell(
            Text("175\$"),
          ),
          DataCell(
            Text("3"),
          ),
        ]),
      ]),
    );
  }
}
