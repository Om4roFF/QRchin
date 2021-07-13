import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:qrching/providers/draw_creation_prvider.dart';
import 'package:qrching/utilities/app_color.dart';

class CreateWidget extends StatelessWidget {
  const CreateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    'Создать розыгрыш',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _sponsorInfo(context),
              _typeOfDraw(context),
              _typeOfSponsor(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sponsorInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.info_outlined,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              'Данные спонсора',
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }

  Widget _typeOfDraw(BuildContext context) {
    return Selector<DrawCreateProvider, bool>(
      builder: (context, data, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 20),
              child: Text(
                'Тип Розыгрыша',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColor.appGreyColor),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment(-2, 0),
                      child: Text(
                        'Публичный',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    leading: Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        value: true,
                        onChanged: (bool? value) {
                          context
                              .read<DrawCreateProvider>()
                              .setTypeOfDraw(value!);
                        },
                        groupValue: data,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment(-1.7, 0),
                      child: Text(
                        'Частный',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    leading: Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        value: false,
                        groupValue: data,
                        onChanged: (bool? value) {
                          context
                              .read<DrawCreateProvider>()
                              .setTypeOfDraw(value!);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      selector: (context, provider) => provider.getTypeOfDraw,
    );
  }

  Widget _typeOfSponsor(BuildContext context) {
    return Selector<DrawCreateProvider, bool>(
      builder: (context, data, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 10),
              child: Text(
                'Тип спонсора',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColor.appGreyColor),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment(-2, 0),
                      child: Text(
                        'Частное лицо',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    leading: Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        value: false,
                        onChanged: (bool? value) {
                          context
                              .read<DrawCreateProvider>()
                              .setTypeOfSponsor(value!);
                        },
                        groupValue: data,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment(-1.7, 0),
                      child: Text(
                        'Фирма',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    leading: Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        value: true,
                        groupValue: data,
                        onChanged: (bool? value) {
                          context
                              .read<DrawCreateProvider>()
                              .setTypeOfSponsor(value!);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      selector: (context, provider) => provider.getTypeOfSponsor,
    );
  }
}
