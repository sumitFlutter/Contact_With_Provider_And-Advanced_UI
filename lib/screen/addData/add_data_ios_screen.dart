

import 'package:contact_info/screen/providers/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../model/contact_model.dart';

class AddDataIosScreen extends StatefulWidget {
  const AddDataIosScreen({super.key});

  @override
  State<AddDataIosScreen> createState() => _AddDataIosScreenState();
}

class _AddDataIosScreenState extends State<AddDataIosScreen> {
  Provider1? providerR;
  TextEditingController nameTxt=TextEditingController();
  TextEditingController mobileTxt=TextEditingController();
  TextEditingController emailTxt=TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR=context.read<Provider1>();
    return CupertinoPageScaffold(navigationBar: CupertinoNavigationBar(middle: Text("Add Contact Screen Ios"),),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(controller: nameTxt,prefix: Icon(CupertinoIcons.person),placeholder: "Enter Your Name:",),
                SizedBox(height: 10,),
                CupertinoTextField(controller: mobileTxt,prefix: Icon(CupertinoIcons.phone),placeholder: "Enter Your Mobile Number:",),
                SizedBox(height: 10,),
                CupertinoTextField(controller: emailTxt,prefix: Icon(CupertinoIcons.mail),placeholder: "Enter Your Email Address",),
                SizedBox(height: 20,),
                CupertinoButton(onPressed: () {
                  Contact c1=Contact(name: nameTxt.text, mobile: mobileTxt.text, image: "assets/image/profile.png", email: emailTxt.text);
                  providerR!.addData(c1: c1);
                  Navigator.pop(context);
                }, child: const Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
