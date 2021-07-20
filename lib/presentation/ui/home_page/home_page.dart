import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qrching/domain/cubit/user_cubit.dart';
import 'package:qrching/domain/cubit/user_state.dart';
import 'package:qrching/domain/model/client_body.dart';
import 'package:qrching/presentation/ui/about_project_page.dart';
import 'package:qrching/presentation/ui/feedback_page.dart';
import 'package:qrching/presentation/ui/home_page/review_widget.dart';
import 'package:qrching/presentation/ui/home_page/scanner_widget.dart';
import 'package:qrching/presentation/ui/question_page.dart';
import 'package:qrching/presentation/ui/settings.dart';
import 'package:qrching/presentation/ui/social_networks.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/providers/draw_creation_prvider.dart';

import '../stats_page.dart';
import '../winners_page.dart';
import 'another_widget.dart';
import 'create_widget.dart';
import 'history_widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> createWidgetKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> reviewWidgetKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> scannerWidgetKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> historyWidgetKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> anotherWidgetKey =
      GlobalKey<NavigatorState>();

  final List<Widget> _children = [
    ChangeNotifierProvider(
      child: CreateWidget(),
      create: (context) => DrawCreateProvider(),
    ),
    ReviewWidget(),
    ScannerWidget(),
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
                    "Не удалось соединиться с сервером. Проверьте подключение к сети интернет",
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      final userCubit = BlocProvider.of<UserCubit>(context);
                      userCubit.initializeClientData();
                    },
                    child: Text('Повторить'),
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
              label: 'Создать'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.cup,
                ),
                height: 30,
                width: 30,
              ),
              label: 'Розыгрыши'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.main,
                ),
                width: 30,
                height: 30,
              ),
              label: 'Сканер'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.history,
                ),
                width: 30,
                height: 30,
              ),
              label: 'История'),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Icon(
                  CustomIcons.more,
                  size: 21,
                ),
                width: 30,
                height: 30,
              ),
              label: 'Ещё'),
        ],
      ),
    );
  }
}
