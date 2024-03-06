import 'package:contact_info/screen/providers/ui_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  UiProvider? uiR;
  UiProvider? uiW;
  Provider1? providerR;
  Provider1? providerW;
  @override
  Widget build(BuildContext context) {
    uiR=context.read<UiProvider>();
    uiW=context.watch<UiProvider>();
    providerR=context.read<Provider1>();
    providerW=context.watch<Provider1>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text("Contact App Ios"),),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Ios Ui",style: TextStyle(color: CupertinoColors.black),), CupertinoSwitch(value:uiW!.iosUi ,onChanged: (value) {
                  uiR!.setUi();
                },),])
            ),
          ],
        ),
      ),);
  }
}
