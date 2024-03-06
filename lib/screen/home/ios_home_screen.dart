import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  Provider1? providerR;
  Provider1? providerW;
  @override
  Widget build(BuildContext context) {
    providerR=context.read<Provider1>();
    providerW=context.watch<Provider1>();
    return CupertinoPageScaffold(
      child: Container(

      ),
        navigationBar: CupertinoNavigationBar(
          middle: Text("Contact App Ios"),),);
  }
}
