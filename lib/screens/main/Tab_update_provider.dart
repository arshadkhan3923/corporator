import 'package:flutter/foundation.dart';

class UpdateIndex extends ChangeNotifier{

  var index=0;

void indexUpdate(var aa){
  index=aa;
  notifyListeners();

}


}