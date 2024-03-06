import 'package:contact_info/utils/shared_helper.dart';
import 'package:flutter/cupertino.dart';

class UiProvider with ChangeNotifier{
  bool iosUi=false;
  bool pAppUi=false;
  void setUi()
  async {
    iosUi=!iosUi;
    saveUi(pUi: iosUi);
    pAppUi=(await applyUi())!;
    notifyListeners();
  }
  void getUi()
  async{
    if(await applyUi()==null)
    {
      pAppUi=false;
    }
    else
    {
      pAppUi=(await applyUi())!;
    }
    notifyListeners();
  }

}