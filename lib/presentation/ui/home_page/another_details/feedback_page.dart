import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';
import 'package:qrching/providers/application_provider.dart';

class FeedbackPage extends StatelessWidget {
  final _emailFormField = GlobalKey<FormFieldState>();

  void validateAndSave() {
    final FormFieldState? form = _emailFormField.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

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
          title: Text('Обратная свзяь'),
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
                        'Мы приложим все усилия, чтобы ответить на твоё сообщение в кратчайшие сроки.'),
                _AppealForm(),
                _FullNameField(),
                _EmailFormField(_emailFormField),
                _PhoneFormField(),
                _ThemeOfMessage(),
                _TitleFormField(),
                _BodyFormField(),
                _AccessButton(),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 20),
                  child: TextButton(
                    child: Text(
                      'Отправить сообщение',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    ),
                    onPressed: () {
                      validateAndSave();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppealForm extends StatelessWidget {
  final List<String> popUpText = ['Официальное', 'Деловое'];

  // String value = 'Официальное';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        final list = List.generate(
          popUpText.length,
          (index) => PopupMenuItem(
            child: SizedBox(
              width: 600,
              child: Text(popUpText[index]),
            ),
          ),
        );
        return list;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: ListTile(
          title: Text('Обращение *'),
          trailing: Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}

class _FullNameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 15, left: 15, right: 5),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintText: 'Имя *',
                border: InputBorder.none,
                focusedBorder: _onFocused(context),
                enabledBorder: _enabled(context),
                errorBorder: _errorBorder(context),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Name cannot be empty!';
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 15, right: 15, left: 5),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintText: 'Фамилия *',
                border: InputBorder.none,
                focusedBorder: _onFocused(context),
                enabledBorder: _enabled(context),
                errorBorder: _errorBorder(context),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Surname cannot be empty!';
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailFormField extends StatelessWidget {
  final GlobalKey<FormFieldState> _textFormField;

  const _EmailFormField(this._textFormField);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextFormField(
        key: _textFormField,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintText: 'Электронная почта *',
          focusedBorder: _onFocused(context),
          enabledBorder: _enabled(context),
          errorBorder: _errorBorder(context),
        ),
        validator: (value) {
          if (value!.isEmpty) return 'Email cannot be empty!';
          if (!value.contains('@')) return 'Email must contain @';
        },
      ),
    );
  }
}

InputBorder _onFocused(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: Theme.of(context).primaryColor,
    ),
  );
}

InputBorder _enabled(BuildContext context) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Theme
        .of(context)
        .dividerColor),
    borderRadius: BorderRadius.circular(5),
  );
}

InputBorder _errorBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Colors.red,
      ));
}

class _PhoneFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintText: 'Телефон',
          border: InputBorder.none,
          focusedBorder: _onFocused(context),
          enabledBorder: _enabled(context),
          errorBorder: _errorBorder(context),
        ),
      ),
    );
  }
}

class _ThemeOfMessage extends StatelessWidget {
  final List<String> popUpText = ['Официальное', 'Деловое'];

  // String value = 'Официальное';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        final list = List.generate(
          popUpText.length,
              (index) =>
              PopupMenuItem(
                child: SizedBox(
                  width: 600,
                  child: Text(popUpText[index]),
                ),
              ),
        );
        return list;
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Theme
                .of(context)
                .dividerColor,
          ),
        ),
        child: ListTile(
          title: Text('Обращение *'),
          trailing: Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}

class _TitleFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintText: 'Заголовок сообщения *',
          border: InputBorder.none,
          focusedBorder: _onFocused(context),
          enabledBorder: _enabled(context),
          errorBorder: _errorBorder(context),
        ),
        validator: (value) {
          if (value!.isEmpty) return 'Form field cannot be empty!';
        },
      ),
    );
  }
}

class _BodyFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          hintText: 'Текст сообщения *',
          border: InputBorder.none,
          focusedBorder: _onFocused(context),
          enabledBorder: _enabled(context),
          errorBorder: _errorBorder(context),
        ),
        validator: (value) {
          if (value!.isEmpty) return 'Form field cannot be empty!';
        },
        minLines: 3,
        maxLines: 6,
      ),
    );
  }
}

class _AccessButton extends StatefulWidget {
  @override
  __AccessButtonState createState() => __AccessButtonState();
}

class __AccessButtonState extends State<_AccessButton> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CheckboxListTile(
        title: RichText(
          text:
          TextSpan(style: Theme
              .of(context)
              .textTheme
              .bodyText2, children: [
            TextSpan(text: 'Я прочитал(а) и принимаю условия '),
            TextSpan(
              text: 'Политики конфиденциальности',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' и '),
            TextSpan(
                text: 'Условия обработки персональных данных. *',
                style: TextStyle(fontWeight: FontWeight.bold))
          ]),
        ),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue!;
          });
        },
        controlAffinity:
        ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }
}

// class _SendMessage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
//       child: TextButton(
//         child: Text(
//           'Отправить сообщение',
//           style: Theme.of(context)
//               .textTheme
//               .bodyText1!
//               .copyWith(color: Theme.of(context).primaryColorLight),
//         ),
//         onPressed: () {},
//         style: TextButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           minimumSize: Size(double.infinity, 50),
//           backgroundColor: Theme.of(context).primaryColor,
//         ),
//       ),
//     );
//   }
// }
