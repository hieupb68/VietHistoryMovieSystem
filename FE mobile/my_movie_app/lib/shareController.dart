
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/service/storage_service.dart';

class ShareController extends GetxController {
  RxString language = "vi".obs;
  RxString icon = ''.obs;
  RxBool isDarkMode = false.obs;
  RxBool isLogin = false.obs;
  RxString username = ''.obs;

  RxInt star = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    language.value =
        await StorageService.getString("language", defaultValue: "vi");
    var locale = language.value == 'vi'
        ? const Locale('vi', 'VN')
        : const Locale('en', 'US');
    Get.updateLocale(locale);
    icon.value = language.value == 'vi'? 'assets/svg/vietnam.svg': 'assets/svg/ic_england.svg';
    final darkMode =  await StorageService.getString("darkMode",defaultValue:  'false');
    isDarkMode.value = darkMode== 'false'? false :true;
    !isDarkMode.value? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
    username.value = await StorageService.getString("username")??'';
    isLogin.value =  username.value.isNotEmpty? true:false;
  }

  void changedStar(int number) {
    star.value = number;
  }
  void changeDarkMode(){
    StorageService.saveString("darkMode",Get.isDarkMode? 'false':'true');
    Get.isDarkMode
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
  }
  void changeLanguage(){
    var locale = Get.locale == const Locale('en', 'US')
        ? const Locale('vi', 'VN')
        : const Locale('en', 'US');
    icon.value = Get.locale == const Locale('en', 'US')
        ? 'assets/svg/vietnam.svg': 'assets/svg/ic_england.svg';
    StorageService.saveString("language",locale.languageCode);

    Get.updateLocale(locale);
  }
  Future<void> saveLogin(String name)async{
    StorageService.saveString("username",name);
    isLogin.value = true;
    username.value = name;
  }
 Future<void> logout()async{
    isLogin.value = false;
    username.value ='';
    StorageService.remove("username");
  }

}
