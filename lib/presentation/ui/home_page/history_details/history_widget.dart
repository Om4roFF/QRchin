import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrching/domain/constants.dart';
import 'package:qrching/domain/model/history.dart';

import 'history_view_page.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  'История',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _HistoryListView(),
          ],
        ),
      ),
    );
  }
}

class _HistoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<History>(AppConstants.historyBox).listenable(),
        builder: (BuildContext context, Box<History> historyBox, _) {
          if (historyBox.values.isEmpty) {
            return Container();
          }
          return Expanded(
            child: ListView.builder(
                itemCount: historyBox.values.length,
                itemBuilder: (context, index) {
                  final res = historyBox.getAt(index);
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                        width: 0.5,
                      ),
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 13, right: 13, top: 10),
                    child: ListTile(
                      // leading: res.iconUrl ?? ,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HistoryViewPage(history: res),
                          ),
                        );
                      },
                      subtitle: Text(res!.date),
                      title: Text(
                        res.url,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                  );
                }),
          );
        });
  }
}
