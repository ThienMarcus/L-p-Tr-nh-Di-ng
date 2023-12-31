// ignore: file_names
import 'package:haizz/providers/mainViewModel.dart';
import 'package:haizz/ui/AppConstant.dart';
import 'package:flutter/material.dart';

class SubPageTimKiem extends StatelessWidget {
  const SubPageTimKiem({super.key});
  static int idPage = 3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
          color: AppConstant.mainColor,
          child: Center(
            child: Text("TimKiem", style: TextStyle(color: Colors.white),),
          )),
    );
  }
}