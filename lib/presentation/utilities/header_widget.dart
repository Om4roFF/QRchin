import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String content;

  const HeaderWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).dividerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AutoSizeText(
            content,
            minFontSize: 14,
          ),
        ),
      ),
    );
  }
}
