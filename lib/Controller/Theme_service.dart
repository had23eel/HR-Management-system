import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {

  final lightTheme = ThemeData.light().copyWith(
    primaryColor : Colors.black ,
    appBarTheme : const AppBarTheme(color: Color(0xFF014380)),
    dividerColor: Colors.black,

  );
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor : Colors.white54,
      appBarTheme : const AppBarTheme(color: Color(0xFF1C4966)),
      dividerColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey.shade900

  );
final _getStorage = GetStorage();
final _darkThemeKey = 'isDarkTheme';

void saveThemeData(bool isDarkMode){
  _getStorage.write(_darkThemeKey, isDarkMode);
}
bool isSavedDarkMode(){
  return  _getStorage.read(_darkThemeKey)??false  ;
  }
ThemeMode getThemeMode(){
  return isSavedDarkMode()? ThemeMode.dark : ThemeMode.light ;
}
void changeTheme(){
  Get.changeThemeMode(isSavedDarkMode()? ThemeMode.light:ThemeMode.dark);
  saveThemeData(!isSavedDarkMode());
}
}