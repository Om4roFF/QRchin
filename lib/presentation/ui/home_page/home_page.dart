import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qrching/domain/cubit/user_cubit.dart';
import 'package:qrching/domain/cubit/user_state.dart';
import 'package:qrching/presentation/ui/home_page/review_widget.dart';
import 'package:qrching/presentation/ui/home_page/scanner_widget.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/providers/draw_creation_prvider.dart';

import 'another_widget.dart';
import 'create_widget.dart';
import 'history_widget.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _children = [
    ChangeNotifierProvider(
      child: CreateWidget(),
      create: (context) => DrawCreateProvider(),
    ),
    ReviewWidget(),
    ScannerWidget(),
    HistoryWidget(),
    AnotherWidget()
  ];

  void _onTap(int index, BuildContext context) async {
    Provider.of<ApplicationProvider>(context, listen: false)
        .setNavigationMenuIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserLoadedState) {
          return _children[context
              .select((ApplicationProvider app) => app.getNavigationIndex)];
        } else if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserErrorState) {
          return Center(
            child: Text("Error state!"),
          );
        } else
          return Container(
            child: Center(
              child: Text('ELSE...'),
            ),
          );
      }),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
        onTap: (index) => _onTap(index, context),
        currentIndex:
            context.select((ApplicationProvider app) => app.getNavigationIndex),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.subtract,
              ),
              label: 'Создать'),
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.vector,
              ),
              label: 'Обзор'),
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.group,
              ),
              label: 'Сканер'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_filled_sharp,
              ),
              label: 'История'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'Ещё'),
        ],
      ),
    );
  }
}
