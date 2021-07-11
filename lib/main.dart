import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/ui/home_page/home_page.dart';
import 'package:qrching/ui/splash_page.dart';
import 'package:qrching/utilities/app_theme.dart';
import 'package:qrching/utilities/application.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isDark = await Application.isDarkTheme();
  final String lang = await Application.getLanguage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApplicationProvider(isDark, lang),
      ),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: Provider.of<ApplicationProvider>(context).getDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: HomePage(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'package:flutter/services.dart';
// import 'package:country_codes/country_codes.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await CountryCodes.init();
//   runApp(CountryCodesExampleApp());
// }
//
// class CountryCodesExampleApp extends StatelessWidget {
//   TableRow _buildEntry({required String title, required String description}) {
//     return TableRow(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(right: 5.0),
//           child: Text(
//             title,
//             textAlign: TextAlign.end,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 5.0),
//           child: Text(description),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Country codes example app'),
//         ),
//         body: Builder(builder: (context) {
//           CountryDetails details = CountryCodes.detailsForLocale();
//           Locale locale = CountryCodes.getDeviceLocale()!;
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Table(
//                     border: TableBorder(
//                       horizontalInside: const BorderSide(width: 0.5),
//                       verticalInside: const BorderSide(width: 0.5),
//                       top: const BorderSide(),
//                       bottom: const BorderSide(),
//                       left: const BorderSide(),
//                       right: const BorderSide(),
//                     ),
//                     children: <TableRow>[
//                       _buildEntry(
//                           title: 'Device region',
//                           description:
//                               '${locale.languageCode}-${locale.countryCode}'),
//                       _buildEntry(
//                           title: 'Name', description: '${details.name}'),
//                       _buildEntry(
//                           title: 'Localized (PT lang)',
//                           description: '${details.localimport 'package:qr_code_scanner/qr_code_scanner.dart';izedName}'),
//                       _buildEntry(
//                           title: 'Alpha 2',
//                           description: '${details.alpha2Code}'),
//                       _buildEntry(
//                           title: 'Dial code',
//                           description: '${details.dialCode}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 200.0,
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     inputFormatters: [DialCodeFormatter()],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// import 'dart:math' as math;
//
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Expandable Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State createState() {
//     return MyHomePageState();
//   }
// }
//
// class MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Expandable Demo"),
//       ),
//       body: ExpandableTheme(
//         data: const ExpandableThemeData(
//           iconColor: Colors.blue,
//           useInkWell: true,
//         ),
//         child: ListView(
//           physics: const BouncingScrollPhysics(),
//           children: <Widget>[
//             Card2(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// const loremIpsum =
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
//
// class Card2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildCollapsed3() {
//       return Container(
//         height: 20,
//         width: 30,
//       );
//     }
//
//     buildExpanded3() {
//       return Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               loremIpsum,
//               softWrap: true,
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ExpandableNotifier(
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 20),
//         child: ScrollOnExpand(
//           child: Card(
//             color: Color.fromRGBO(245, 245, 245, 1),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expandable(
//                   collapsed: buildCollapsed3(),
//                   expanded: buildExpanded3(),
//                 ),
//                 Align(
//                   alignment: Alignment(-1.05, 1.5),
//                   heightFactor: 0.5,
//                   child: Builder(builder: (context) {
//                     var controller =
//                         ExpandableController.of(context, required: true)!;
//                     return SizedBox(
//                       height: 24,
//                       width: 24,
//                       child: FloatingActionButton(
//                         backgroundColor: const Color(0xff03dac6),
//                         foregroundColor: Colors.black,
//                         onPressed: () {
//                           controller.toggle();
//                         },
//                         child: Icon(Icons.add),
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
