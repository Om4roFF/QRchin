import 'package:flutter/material.dart';

class LoadingDialogBox extends StatelessWidget {
  const LoadingDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Container(
        width: 300,
        height: 300,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
