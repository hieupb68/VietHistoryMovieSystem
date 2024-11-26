import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}