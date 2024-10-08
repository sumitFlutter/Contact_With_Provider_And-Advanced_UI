import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class HiddenScreen extends StatefulWidget {
  const HiddenScreen({super.key});

  @override
  State<HiddenScreen> createState() => _HiddenScreenState();
}

class _HiddenScreenState extends State<HiddenScreen> {
  Provider1? providerR;
  Provider1? providerW;
  @override
  Widget build(BuildContext context) {
    providerR=context.read<Provider1>();
    providerW=context.watch<Provider1>();
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                "My  Hidden Contacts",
                style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemCount: providerW?.hiddenContactList.length,
                      itemBuilder: (context, index) => Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "view",arguments: [index,true]);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [providerW?.hiddenContactList[index].image=="assets/image/profile.png"?
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(providerW!.hiddenContactList[index].image!),):
                                CircleAvatar(
                                    radius: 25,
                                    backgroundImage: FileImage(
                                        File(providerW!.hiddenContactList[index].image!))),
                                  const SizedBox(width: 20,),
                                  Text(
                                    "${providerW?.hiddenContactList[index].name}",
                                    style: const TextStyle(fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
