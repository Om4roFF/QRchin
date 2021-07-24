import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';
import 'package:qrching/providers/application_provider.dart';

class WinnersPage extends StatelessWidget {
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
          title: Text('Победители'),
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
                HeaderWidget(
                    content:
                        'Здесь представлены последние 100 победителей публичных розыгрышей.'),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  color: Theme.of(context).primaryColorLight,
                  elevation: 0,
                  margin: EdgeInsets.only(left: 13, right: 13, top: 10),
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('№')),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Text(
                              'Выигрыш',
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Дата'),
                            )),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text('Победитель'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 26),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Expanded(
                //         child: Text('№'),
                //         flex: 1,
                //       ),
                //       Expanded(
                //         child: Text('Выигрыш'),
                //         flex: 2,
                //       ),
                //       Expanded(
                //         child: Text('Дата'),
                //         flex: 2,
                //       ),
                //       Expanded(
                //         child: Text('Победитель'),
                //         flex: 2,
                //       ),
                //     ],
                //   ),
                // ),
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
                          // onTap: ()=> _launchURL('https://youtube.com'),
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
                                            color: Color.fromRGBO(
                                                229, 229, 229, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Tooltip(
                                    message: '145\$',
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 10),
                                      child: Text(
                                        '145\$',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "11.11.2021",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Роман Романов',
                                      style: TextStyle(fontSize: 12),
                                    ),
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
          ),
        ),
      ),
    );
  }
}
