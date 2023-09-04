import 'package:flutter/material.dart';
import 'package:trial_project/firstpage.dart';
import 'package:trial_project/secondpage.dart';
import 'package:trial_project/thirdpage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  ValueNotifier notifier = ValueNotifier(0);
  List screen = [FirstPage(), SecondPage(), ThirdPage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("BottomNavigationBarDemo"),
              backgroundColor: Colors.cyan,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded), label: "FirstPage"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded), label: "SecondPage"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_sharp), label: "ThirdPage"),
              ],
              currentIndex: value,
              onTap: (value) {
                notifier.value = value;
              },
            ),
            body: screen[value],
            // body: SafeArea(
            //     child: Center(
            //   child: Text("This is HomePage"),
            // )),
          );
        });
  }
}
