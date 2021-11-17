import 'package:shared_preferences/shared_preferences.dart';

void saveImage(String key, path) async {
  SharedPreferences saveimage = await SharedPreferences.getInstance();
  saveimage.setString(key, path);
}

Future loadImage(String key) async {
  SharedPreferences loadimage = await SharedPreferences.getInstance();
  return loadimage.getString(key);
}

//------------------------------------------------------------------//

void saveData(String key, mylist) async {
  SharedPreferences saveData = await SharedPreferences.getInstance();
  saveData.setStringList(key, mylist);
}

Future getData(String key) async {
  SharedPreferences loadData = await SharedPreferences.getInstance();
  //Return String
  return loadData.getStringList(key);
}
