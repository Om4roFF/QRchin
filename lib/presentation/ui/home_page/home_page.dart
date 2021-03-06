import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qrching/domain/cubit/user_cubit.dart';
import 'package:qrching/domain/cubit/user_state.dart';
import 'package:qrching/internal/dependencies/scanner_state_module.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/providers/draw_creation_prvider.dart';

import 'another_details/about_project_page.dart';
import 'another_details/another_widget.dart';
import 'another_details/feedback_page.dart';
import 'another_details/question_page.dart';
import 'another_details/settings.dart';
import 'another_details/social_networks.dart';
import 'another_details/stats_page.dart';
import 'another_details/winners_page.dart';
import 'create_details/create_widget.dart';
import 'history_details/history_widget.dart';
import 'review_details/review_widget.dart';
import 'scan_details/scanner_widget.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _children = [
    ChangeNotifierProvider(
      child: CreateWidget(),
      create: (context) => DrawCreateProvider(),
    ),
    ReviewWidget(),
    BlocProvider(
      create: (context) => ScannerStateModule.scannerCubit(),
      child: ScannerWidget(),
    ),
    HistoryWidget(),
    AnotherWidget(),
    AboutProjectPage(),
    WinnersPage(),
    StatisticPage(),
    SocialMedia(),
    QuestionPage(),
    FeedbackPage(),
    SettingsPage(),
  ];

  HomePage();

  void _onTap(int index, BuildContext context) async {
    Provider.of<ApplicationProvider>(context, listen: false)
        .setNavigationMenuIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadedState) {
            return _children[context
                .select((ApplicationProvider app) => app.getNavigationIndex)];
          } else if (state is UserLoadingState) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is UserErrorState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "???? ?????????????? ?????????????????????? ?? ????????????????. ?????????????????? ?????????????????????? ?? ???????? ????????????????",
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      final userCubit = BlocProvider.of<UserCubit>(context);
                      userCubit.initializeClientData();
                    },
                    child: Text('??????????????????'),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // unselectedFontSize: 10,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        elevation: 6,
        backgroundColor: Theme.of(context).backgroundColor,
        onTap: (index) => _onTap(index, context),
        currentIndex: context.select(
                    (ApplicationProvider app) => app.getNavigationIndex) <
                5
            ? context
                .select((ApplicationProvider app) => app.getNavigationIndex)
            : 4,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.subtract,
                ),
                width: 30,
                height: 30,
              ),
              label: '??????????????'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.cup,
                ),
                height: 30,
                width: 30,
              ),
              label: '??????????????????'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.main,
                ),
                width: 30,
                height: 30,
              ),
              label: '????????????'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.history,
                ),
                width: 30,
                height: 30,
              ),
              label: '??????????????'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.more,
                  size: 21,
                ),
                width: 30,
                height: 30,
              ),
              label: '??????'),
        ],
      ),
    );
  }
}
